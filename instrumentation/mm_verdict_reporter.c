#include "mm_verdict_reporter.h"
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static MMVerdictReporter reporters[MM_MAX_REPORTERS];
static int reporter_count = 0;

void mm_add_reporter(const MMVerdictReporter *reporter) {
    if (!reporter || reporter_count >= MM_MAX_REPORTERS) return;
    reporters[reporter_count] = *reporter;
    reporter_count++;
}

void mm_clear_reporters(void) {
    reporter_count = 0;
    memset(reporters, 0, sizeof(reporters));
}

void mm_report_verdict(MMVerdict verdict) {
    for (int i = 0; i < reporter_count; i++)
        if (reporters[i].on_verdict)
            reporters[i].on_verdict(verdict, reporters[i].ctx);
}

/* No retorna */
void mm_report_abort(MMVerdict verdict) {
    for (int i = 0; i < reporter_count; i++)
        if (reporters[i].on_abort)
            reporters[i].on_abort(verdict, reporters[i].ctx);
    _exit(0);
}
