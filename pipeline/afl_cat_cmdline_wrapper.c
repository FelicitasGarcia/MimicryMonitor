/*
 * afl_cat_cmdline_wrapper.c
 *
 * AFL wrapper for grammar-guided command-line fuzzing of catPUA.
 *
 * INPUT (from AFL via @@): a cat command line produced by cat_command_line.json, e.g.
 *   cat -A fuzz_a
 *   cat fuzz_a > fuzz_a        <- fd-aliasing: stdout and input share the same inode
 *   cat fuzz_a > fuzz_b        <- normal: different files
 *   cat -n fuzz_a fuzz_b > fuzz_a
 *
 * What this wrapper does:
 *   1. Reads and tokenizes the AFL-generated command line.
 *   2. Maps every filename token to a real path:
 *        fuzz_a / fuzz_b / fuzz_c -> /tmp/cat_fuzz/{a,b,c}  (pre-populated)
 *        /dev/null, /dev/stdin, /dev/zero, /proc/*, /etc/hostname -> pass through
 *        anything else            -> /tmp/cat_fuzz/tmp_N       (pre-populated)
 *   3. Detects "> FILENAME": opens the resolved output path for writing and
 *      dup2's it onto stdout BEFORE exec.  When the redirect target resolves to
 *      the same real path as one of the input files, stdout and catPUA's input fd
 *      share the same inode -- the fd-aliasing condition that triggers the patch.
 *   4. If no input files appear (cat reads stdin), redirects stdin from /dev/null
 *      so the process doesn't hang waiting for AFL to feed it.
 *   5. exec's catPUA with the resolved argv.
 *
 * Build (done automatically by fuzz.sh -wrapper-src):
 *   afl-clang-fast pipeline/afl_cat_cmdline_wrapper.c \
 *     -DTARGET_BINARY="\"$(pwd)/work/outputs/instrumentedPUA\"" \
 *     -o pipeline/afl_cat_cmdline_wrapper
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

#ifndef TARGET_BINARY
#define TARGET_BINARY "./work/outputs/instrumentedPUA"
#endif

#define TMPDIR       "/tmp/cat_fuzz"
#define MAX_TOKENS   64
#define MAX_FILES    16
#define MAX_NAME_LEN 128
#define MAX_PATH_LEN 256

/* Content written to every temp file so cat actually has something to read.
 * Includes tabs and show-nonprinting chars so -A/-T/-v flags exercise their paths. */
static const char SEED_CONTENT[] =
    "hello world\n"
    "\ttabbed line\n"
    "line with \x01\x02 control chars\n"
    "empty next:\n"
    "\n"
    "end\n";

/* ── filename → real path mapping ──────────────────────────────────────── */

typedef struct { char name[MAX_NAME_LEN]; char path[MAX_PATH_LEN]; } FileEntry;
static FileEntry fmap[MAX_FILES];
static int       fmap_n = 0;

/* Paths safe to pass through: fixed-size readable files only.
 * /dev/zero and /dev/stdin are excluded — they produce infinite reads
 * and hang AFL's calibration phase. */
static int is_passthrough(const char *s)
{
    return (strcmp(s, "/dev/null") == 0 ||
            strcmp(s, "/etc/hostname") == 0 ||
            strncmp(s, "/proc/", 6) == 0);
}

static void ensure_tmpdir(void)
{
    static int done = 0;
    if (!done) { mkdir(TMPDIR, 0755); done = 1; }
}

static const char *resolve(const char *name)
{
    if (is_passthrough(name)) return name;

    /* Check if already mapped. */
    for (int i = 0; i < fmap_n; i++)
        if (strncmp(fmap[i].name, name, MAX_NAME_LEN - 1) == 0)
            return fmap[i].path;

    if (fmap_n >= MAX_FILES) return "/dev/null";

    ensure_tmpdir();
    int idx = fmap_n++;
    strncpy(fmap[idx].name, name, MAX_NAME_LEN - 1);
    fmap[idx].name[MAX_NAME_LEN - 1] = '\0';

    /* Known sentinel names get fixed, stable paths so aliasing is reproducible. */
    if      (strcmp(name, "fuzz_a") == 0) snprintf(fmap[idx].path, MAX_PATH_LEN, "%s/a", TMPDIR);
    else if (strcmp(name, "fuzz_b") == 0) snprintf(fmap[idx].path, MAX_PATH_LEN, "%s/b", TMPDIR);
    else if (strcmp(name, "fuzz_c") == 0) snprintf(fmap[idx].path, MAX_PATH_LEN, "%s/c", TMPDIR);
    else                                   snprintf(fmap[idx].path, MAX_PATH_LEN, "%s/t%d", TMPDIR, idx);

    /* Pre-populate so catPUA has something to read. */
    int fd = open(fmap[idx].path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd >= 0) {
        write(fd, SEED_CONTENT, sizeof(SEED_CONTENT) - 1);
        close(fd);
    }
    return fmap[idx].path;
}

/* ── helpers ────────────────────────────────────────────────────────────── */

static int is_flag(const char *s) { return s[0] == '-' && s[1] != '\0'; }
static int is_redirect(const char *s) { return strcmp(s, ">") == 0; }

/* ── main ────────────────────────────────────────────────────────────────── */

int main(int argc, char *argv[])
{
    if (argc < 2) return 1;

    /* Read AFL input file (@@). */
    FILE *f = fopen(argv[1], "r");
    if (!f) return 1;
    char line[4096] = {0};
    fgets(line, sizeof(line), f);
    fclose(f);
    line[strcspn(line, "\r\n")] = '\0';

    /* Tokenize on whitespace. */
    char *tok[MAX_TOKENS];
    int   ntok = 0;
    char *p = strtok(line, " \t");
    while (p && ntok < MAX_TOKENS - 1) { tok[ntok++] = p; p = strtok(NULL, " \t"); }
    tok[ntok] = NULL;
    if (ntok == 0) return 0;

    /* Grammar always starts with "cat"; skip it. */
    int start = (strcmp(tok[0], "cat") == 0) ? 1 : 0;

    /* ── Pass 1: collect input file names (before >) ─────────────────── */
    char *in_names[MAX_FILES];
    int   n_in = 0;
    for (int i = start; i < ntok; i++) {
        if (is_redirect(tok[i])) { i++; continue; }   /* skip redirect target */
        if (!is_flag(tok[i]) && n_in < MAX_FILES)
            in_names[n_in++] = tok[i];
    }

    /* ── Pass 2: build exec argv, handle redirect ─────────────────────── */
    char *exec_argv[MAX_TOKENS + 2];
    int   exec_argc = 0;
    const char *redir_real = NULL;
    int         aliasing   = 0;

    exec_argv[exec_argc++] = TARGET_BINARY;

    for (int i = start; i < ntok; i++) {
        if (is_redirect(tok[i])) {
            if (i + 1 >= ntok) continue;
            const char *out_name = tok[++i];
            redir_real = resolve(out_name);

            /* Aliasing: redirect target resolves to same real path as an input. */
            for (int j = 0; j < n_in; j++) {
                if (strcmp(resolve(in_names[j]), redir_real) == 0) {
                    aliasing = 1;
                    break;
                }
            }
        } else if (is_flag(tok[i])) {
            exec_argv[exec_argc++] = tok[i];
        } else {
            exec_argv[exec_argc++] = (char *)resolve(tok[i]);
        }
    }
    exec_argv[exec_argc] = NULL;

    /* ── stdin: prevent hang when no input files ─────────────────────── */
    if (n_in == 0) {
        int null_fd = open("/dev/null", O_RDONLY);
        if (null_fd >= 0) { dup2(null_fd, STDIN_FILENO); close(null_fd); }
    }

    /* ── stdout redirect ─────────────────────────────────────────────── */
    if (redir_real) {
        /*
         * Aliasing case: do NOT truncate before catPUA opens the file for reading.
         * Using O_WRONLY | O_CREAT (no O_TRUNC) keeps the seed content in place so
         * catPUA's read fd sees data while its write fd (stdout) shares the inode.
         * That is exactly the condition cat's fstat-aliasing check fires on.
         *
         * Non-aliasing case: truncate normally.
         */
        int flags = aliasing
            ? (O_WRONLY | O_CREAT)
            : (O_WRONLY | O_CREAT | O_TRUNC);
        int out_fd = open(redir_real, flags, 0644);
        if (out_fd >= 0) { dup2(out_fd, STDOUT_FILENO); close(out_fd); }
    }

    execv(TARGET_BINARY, exec_argv);
    return 1;   /* execv only returns on error */
}
