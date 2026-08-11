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
    /* Opcional. Llamado en cada transición del autómata con un id de arista
       sensible al camino recorrido (hash(nodo_actual) XOR (prev_loc >> 1),
       al estilo AFL) y el veredicto del nodo destino. NULL si el reporter
       no lo necesita -- no rompe reporters existentes (mm_log_reporter no
       lo setea). */
    void (*on_transition)(uint32_t edge_id, MMVerdict verdict, void *ctx);
    void *ctx;
} MMVerdictReporter;

/* Agrega un reporter a la cadena. Hasta MM_MAX_REPORTERS reporters activos. */
void mm_add_reporter(const MMVerdictReporter *reporter);

/* Limpia todos los reporters registrados. */
void mm_clear_reporters(void);

/* Llamado por el runtime cada vez que el autómata entra a un nodo con veredicto. */
void mm_report_verdict(MMVerdict verdict);

/* Llamado por el runtime en cada transición real del autómata (no en el nodo
   inicial). edge_id es sensible al camino recorrido, no solo al nodo actual. */
void mm_report_transition(uint32_t edge_id, MMVerdict verdict);

/* Llamado por el runtime cuando la política dispara un abort.
   Invoca on_abort en todos los reporters y luego exit(1). No retorna. */
void mm_report_abort(MMVerdict verdict);

#endif /* MM_VERDICT_REPORTER_H */
