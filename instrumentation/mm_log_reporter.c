#include "mm_verdict_reporter.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

/* Por default loguea a stderr. Podés cambiar esto con mm_log_set_file(). */
static FILE *log_file = NULL;
static char log_path[4096] = {0};

static FILE *get_log(void)
{
    return log_file ? log_file : stderr;
}

static const char *verdict_str(MMVerdict v)
{
    switch (v)
    {
    case MM_VERDICT_V:
        return "V";
    case MM_VERDICT_IV:
        return "IV";
    default:
        return "UNKNOWN";
    }
}

void mm_log_runtimef(const char *fmt, ...)
{
    va_list args;
    FILE *out = get_log();

    va_start(args, fmt);
    vfprintf(out, fmt, args);
    va_end(args);
    fputc('\n', out);
    fflush(out);
}

void mm_log_divider(void)
{
    FILE *out = get_log();
    fprintf(out, "------------------------------------------------------------\n");
    fflush(out);
}

void mm_log_header(const char *title)
{
    FILE *out = get_log();
    mm_log_divider();
    fprintf(out, "%s\n", title ? title : "MONITOR LOG");
    mm_log_divider();
    fflush(out);
}

static void log_on_verdict(MMVerdict verdict, void *ctx)
{
    (void)ctx;
    mm_log_runtimef("verdict update: %s", verdict_str(verdict));
}

static void log_on_abort(MMVerdict verdict, void *ctx)
{
    (void)ctx;
    mm_log_runtimef("monitor aborted due to verdict: %s", verdict_str(verdict));
    if (log_file)
    {
        fclose(log_file);
        log_file = NULL;
    }
}

/* ------------------------------------------------------------------ */
/* API pública                                                          */
/* ------------------------------------------------------------------ */

/* Redirigir logs a un archivo. Pasa NULL para volver a stderr. */
void mm_log_set_file(const char *path)
{
    if (log_file)
    {
        fclose(log_file);
        log_file = NULL;
    }
    log_path[0] = '\0';
    if (path)
    {
        strncpy(log_path, path, sizeof(log_path) - 1);
        log_path[sizeof(log_path) - 1] = '\0';
        log_file = fopen(log_path, "a");
        if (log_file)
        {
            mm_log_header("MONITOR LOG");
            mm_log_runtimef("log file opened: %s", log_path);
        }
    }
}

/* Trunca el archivo de log para arrancar una nueva iteración limpia. */
void mm_log_clear_file(void)
{
    if (!log_path[0])
        return;
    if (log_file)
    {
        fclose(log_file);
        log_file = NULL;
    }
    log_file = fopen(log_path, "w");
    if (!log_file)
        return;
    fclose(log_file);
    log_file = fopen(log_path, "a");
    if (log_file)
    {
        mm_log_header("NEW MONITORING ITERATION");
        mm_log_runtimef("log file cleared for new iteration: %s", log_path);
    }
}

static const MMVerdictReporter log_reporter = {
    .on_verdict = log_on_verdict,
    .on_abort = log_on_abort,
    .ctx = NULL,
};

void mm_register_log_reporter(void)
{
    mm_add_reporter(&log_reporter);
}
