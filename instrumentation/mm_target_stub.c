/* No #includes — avoids pulling in gnulib header overrides from coreutils -I paths. */
extern char *getenv(const char *);
extern int   open(const char *, int, ...);
extern long  write(int, const void *, unsigned long);
extern int   close(int);
extern int   atexit(void (*)(void));

#define O_WRONLY  1
#define O_CREAT   64
#define O_APPEND  1024

volatile int mm_target_reached = 0;

static void log_target(void) {
    const char *path = getenv("MM_STOP_LOG");
    if (!path) return;
    int fd = open(path, O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (fd < 0) return;
    const char *line = mm_target_reached
        ? "early=0 verdict=NV steps=0 target=1\n"
        : "early=0 verdict=NV steps=0 target=0\n";
    int len = 0;
    while (line[len]) len++;
    write(fd, line, len);
    close(fd);
}

__attribute__((constructor))
static void register_log(void) {
    atexit(log_target);
}
