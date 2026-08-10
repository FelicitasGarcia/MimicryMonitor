#include "mm_verdict_reporter.h"
#include <stdint.h>
#include <string.h>

/* Exportadas por afl-compiler-rt cuando se compila con afl-clang-fast */
#if defined(__GNUC__) || defined(__clang__)
extern uint8_t *__afl_area_ptr __attribute__((weak));
extern uint32_t __afl_map_size __attribute__((weak));
#else
extern uint8_t *__afl_area_ptr;
extern uint32_t __afl_map_size;
#endif

#if defined(__clang__)
#define MM_NO_COVERAGE __attribute__((no_sanitize("coverage")))
#else
#define MM_NO_COVERAGE
#endif

#ifndef MM_ENABLE_AFL_IV_FEEDBACK
#define MM_ENABLE_AFL_IV_FEEDBACK 0
#endif

/* ------------------------------------------------------------------ */
/* Callbacks                                                            */
/* ------------------------------------------------------------------ */

static MM_NO_COVERAGE void afl_on_verdict(MMVerdict verdict, void *ctx)
{
    (void)ctx;
#if MM_ENABLE_AFL_IV_FEEDBACK
    /*
     * Mark "this execution reached IV" as one extra, fixed byte in AFL's own
     * coverage bitmap -- not a separate channel, the same map afl-fuzz already
     * reads for its virgin-map / favored / calculate_score logic. The first
     * input to ever set this byte gets kept and favored the same way a
     * genuinely rare edge would; every later IV input's rarity score keeps
     * benefiting from it too. __afl_map_size is negotiated per-target at
     * forkserver startup, so index off its *current* value rather than a
     * literal constant -- always in-bounds regardless of map size.
     */
    if (verdict == MM_VERDICT_IV && __afl_area_ptr && __afl_map_size)
        __afl_area_ptr[__afl_map_size - 1] |= 1;
#endif
    (void)verdict;
}

static MM_NO_COVERAGE void afl_on_abort(MMVerdict verdict, void *ctx)
{
    (void)ctx;
    (void)verdict;
    /*
     * Limpiamos el bitmap antes de que AFL++ lo lea.
     * Así el input abortado no aporta coverage falsa y AFL++ lo descarta.
     */
    // if (__afl_area_ptr && __afl_map_size)
    //     memset(__afl_area_ptr, 0, __afl_map_size);
}

/* ------------------------------------------------------------------ */
/* Registro                                                             */
/* ------------------------------------------------------------------ */

static const MMVerdictReporter afl_reporter = {
    .on_verdict = afl_on_verdict,
    .on_abort = afl_on_abort,
    .ctx = NULL,
};

/*
 * Llamar esto desde main() del target, o marcar con
 * __attribute__((constructor)) para que se ejecute automáticamente.
 */
MM_NO_COVERAGE void mm_register_afl_reporter(void)
{
    mm_add_reporter(&afl_reporter);
}

/* Sin constructor automático: el runtime decide cuándo registrarlo. */
