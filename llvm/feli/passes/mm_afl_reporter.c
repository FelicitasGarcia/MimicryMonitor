#include "mm_verdict_reporter.h"
#include <stdint.h>
#include <string.h>

/* Exportadas por afl-compiler-rt cuando se compila con afl-clang-fast */
extern uint8_t  *__afl_area_ptr;
extern uint32_t  __afl_map_size;

/* ------------------------------------------------------------------ */
/* Callbacks                                                            */
/* ------------------------------------------------------------------ */

static void afl_on_verdict(MMVerdict verdict, void *ctx) {
    (void)ctx;
    /*
     * En este momento no necesitamos hacer nada especial:
     * AFL++ ya registró la coverage del path que llevó a este veredicto.
     * Si en el futuro quisieras marcar "llegué a IV" como señal extra,
     * podrías escribir en una posición fija del bitmap, por ejemplo:
     *
     *   if (verdict == MM_VERDICT_IV && __afl_area_ptr)
     *       __afl_area_ptr[MAP_SIZE - 1] |= 1;
     */
    (void)verdict;
}

static void afl_on_abort(MMVerdict verdict, void *ctx) {
    (void)ctx;
    (void)verdict;
    /*
     * Limpiamos el bitmap antes de que AFL++ lo lea.
     * Así el input abortado no aporta coverage falsa y AFL++ lo descarta.
     */
    if (__afl_area_ptr)
        memset(__afl_area_ptr, 0, __afl_map_size);
}

/* ------------------------------------------------------------------ */
/* Registro                                                             */
/* ------------------------------------------------------------------ */

static const MMVerdictReporter afl_reporter = {
    .on_verdict = afl_on_verdict,
    .on_abort   = afl_on_abort,
    .ctx        = NULL,
};

/*
 * Llamar esto desde main() del target, o marcar con
 * __attribute__((constructor)) para que se ejecute automáticamente.
 */
void mm_register_afl_reporter(void) {
    mm_set_reporter(&afl_reporter);
}

/*
 * Constructor automático: si linkeas este archivo junto al target
 * no necesitás llamar mm_register_afl_reporter() manualmente.
 */
__attribute__((constructor))
static void mm_afl_auto_register(void) {
    mm_register_afl_reporter();
}
