#ifndef MM_VERDICT_REPORTER_H
#define MM_VERDICT_REPORTER_H

#include <stdint.h>

#define MM_MAX_REPORTERS 8

typedef enum {
    MM_VERDICT_UNKNOWN = 0,
    MM_VERDICT_V       = 1,
    MM_VERDICT_IV      = 2,
} MMVerdict;

typedef struct {
    void (*on_verdict)(MMVerdict verdict, void *ctx);
    void (*on_abort)(MMVerdict verdict, void *ctx);  // llamado justo antes de exit(1)
    void *ctx;
} MMVerdictReporter;

/* Agrega un reporter a la cadena. Hasta MM_MAX_REPORTERS reporters activos. */
void mm_add_reporter(const MMVerdictReporter *reporter);

/* Limpia todos los reporters registrados. */
void mm_clear_reporters(void);

/* Llamado por el runtime cada vez que el autómata entra a un nodo con veredicto. */
void mm_report_verdict(MMVerdict verdict);

/* Llamado por el runtime cuando la política dispara un abort.
   Invoca on_abort en todos los reporters y luego exit(1). No retorna. */
void mm_report_abort(MMVerdict verdict);

#endif /* MM_VERDICT_REPORTER_H */
