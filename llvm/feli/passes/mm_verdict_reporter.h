#ifndef MM_VERDICT_REPORTER_H
#define MM_VERDICT_REPORTER_H

#include <stdint.h>

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

/* Registra un reporter. Pasa NULL para limpiar. */
void mm_set_reporter(const MMVerdictReporter *reporter);

/* Llamado por el runtime cada vez que el autómata entra a un nodo con veredicto. */
void mm_report_verdict(MMVerdict verdict);

/* Llamado por el runtime cuando la política dispara un abort.
   Invoca on_abort (si hay) y luego exit(1). No retorna. */
void mm_report_abort(MMVerdict verdict);

#endif /* MM_VERDICT_REPORTER_H */
