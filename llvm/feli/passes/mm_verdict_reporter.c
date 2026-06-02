#include "mm_verdict_reporter.h"
#include <stdlib.h>

static MMVerdictReporter active_reporter = { NULL, NULL, NULL };

void mm_set_reporter(const MMVerdictReporter *reporter) {
    if (reporter)
        active_reporter = *reporter;
    else
        active_reporter = (MMVerdictReporter){ NULL, NULL, NULL };
}

void mm_report_verdict(MMVerdict verdict) {
    if (active_reporter.on_verdict)
        active_reporter.on_verdict(verdict, active_reporter.ctx);
}

/* No retorna */
void mm_report_abort(MMVerdict verdict) {
    if (active_reporter.on_abort)
        active_reporter.on_abort(verdict, active_reporter.ctx);
    exit(1);
}
