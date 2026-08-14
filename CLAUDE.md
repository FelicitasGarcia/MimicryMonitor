# MimicryMonitor — contexto para Claude Code

Este archivo es el contrato de contexto del proyecto. Tiene dos capas:

- **Capa estable** (este cuerpo): arquitectura y convenciones. Se edita a mano,
  cambia poco.
- **Capa volátil** (bloque `AUTO` al final): estado de la última sesión.
  La regenera `evaluation/bench/sync_context.py`. **No editar a mano dentro
  de los marcadores** — cualquier edición manual ahí se pierde en el próximo
  sync. La "Conclusión activa" vive fuera de los marcadores y sí se edita
  a mano.

**Regla de fuentes de verdad:** el repo manda sobre hechos mecánicos (flags,
scripts, números crudos); Notion manda sobre interpretación y estado de la
investigación. Ante conflicto, gana la fuente correspondiente al tipo de dato.

---

## Qué es el proyecto

MimicryMonitor instrumenta un binario objetivo con un pass de LLVM
(`instrumentation/`, invocado vía `opt -passes=mimicry-instrument` desde
`pipeline/instrument.sh`) que inserta llamadas a un runtime liviano
(`monitor_runtime.c`). El runtime sigue el progreso del programa contra un
autómata de política con veredictos `MM_VERDICT_IV` (intermedio) y
`MM_VERDICT_V` (target alcanzado), emitidos vía reporters conectables
(`mm_add_reporter`/`mm_report_verdict`): log (`mm_log_reporter.c`) y AFL++
(`mm_afl_reporter.c`).

**Pipeline de build:** `pipeline/run-mimicry.sh` (CLI alto nivel) →
`pipeline/instrument.sh` (IR desde `-pua`, pass de instrumentación, compila
con `afl-clang-fast` si se pasa `-afl`) → `work/outputs/instrumentedPUA[sufijo]`.

**Regla de forwarding de flags:** los flags nuevos de `instrument.sh` /
`run-mimicry.sh` NO llegan solos a las campañas. `targetbench.py` hardcodea
qué flags reenvía: toda opción nueva de instrumentación se cablea
explícitamente en `build_instrumented()`.

## Target: coreutils `cat`

Se fuzzea `cat` vía wrapper (`pipeline/afl_cat_cmdline_wrapper.c`) que parsea
una línea de comando fuzzeada y resuelve redirects/aliasing de file
descriptors. Seeds generadas por Grammar-Mutator
(`/home/felicitas/Grammar-Mutator/`). Corpus: 96 seeds (se removieron 4 que
abortaban la calibración de AFL).

**Target probe:** `mm_target_reached = 1` en `catPUA.c` (~líneas 711-712),
dentro del `if` que detecta aliasing de mismo inode entre stdin y stdout.

**Variantes del ejemplo:**
- `examples/catCU/catPUA.c` — sin sleep.
- `examples/catCU_sleep/catPUA.c` — agrega `usleep(100000)` (100 ms) en el
  `else` del `if` de aliasing (camino de NO-hit). Existe porque sin sleep,
  plain AFL a veces recibe SIGKILL en aliasing con loop infinito → no corre
  `atexit()` → el hit no queda logueado, sesgando la comparación
  instrumented-vs-plain.

## Mecanismo de IV-feedback

Flag opt-in `-afl-iv-feedback`: energiza inputs que alcanzan `MM_VERDICT_IV`
flippeando un byte fijo del bitmap propio de AFL
(`__afl_area_ptr[__afl_map_size - 1] |= 1`). Mismo mapa que usa afl-fuzz para
virgin-map / favored / calculate_score — no es canal aparte. Implementado en
`mm_afl_reporter.c` (`#if MM_ENABLE_AFL_IV_FEEDBACK`), registrado en
`monitor_runtime.c`, cableado end-to-end en `instrument.sh` /
`run-mimicry.sh`, expuesto en `targetbench.py` como `--iv-feedback`.

**Policies:** `--policy stop-v` aborta la ejecución al alcanzar el veredicto
objetivo; `--policy n` desactiva el abort (el monitor corre pero nunca corta),
aislando el efecto puro de instrumentación sin el confound del abort.

## Diseño experimental A/B/C/D

`evaluation/bench/rq1_effect/run_iv_feedback_experiment.py` corre 4 condiciones
interleaved (trial 1 de cada condición antes que trial 2 de cualquiera, para
repartir el ruido de máquina correlacionado en el tiempo):

- `stop_only` — feedback OFF, policy stop-v
- `fb_only` — feedback ON, policy n
- `fb_stop` — feedback ON, policy stop-v
- `none` — AFL plano (se corre una sola vez y se comparte)

## Overhead (RQ2)

Dos metodologías bajo `results/rq2_overhead/`:

1. `overhead_long/` — campaña completa estilo `targetbench.py` con
   `--policy n`.
2. `micro/` (`overhead_micro.py`) — direct-replay del queue de AFL contra
   instrumentado vs. plano, midiendo wall/CPU time (`getrusage`) y ajustando
   regresión ns/step. CPU-time es la métrica confiable; wall-time carga ruido
   de scheduling/fork-exec.

## Genealogía (RQ3)

`results/rq3_genealogy/` — ancestría (.dot) y aristas (.csv) por
trial/variante vía `afl_provenance_export.py` / `afl_provenance_label.py`,
etiquetando cada nodo del queue según descienda de un input que alcanzó el
target.

## Organización de resultados

`evaluation/bench/results/` agrupado por research question:

- `rq1_effect/` — `iv_feedback/`, `grammar_mutator_comparison/`,
  `baseline_pilot/`, `sleep_nosleep/`, `V_sleep/`
- `rq2_overhead/` — `overhead_long/`, `micro/`
- `rq3_genealogy/`

Convención: `results/<experiment>/<campaign>`, carpeta timestampeada nueva
por corrida por default; mismo nombre de `--experiment` en corridas distintas
para agruparlas explícitamente. Nunca se agrupa automáticamente por config.

## Tracking en Notion

Página "Experimentos MM: cat fuzzing" (hija de "Mimicry"), organizada por las
3 RQ. `notion_publish.py` (invocable con `targetbench.py --notion`) publica
por campaña un toggle (gráfico + tabla de `report.md`) y actualiza la fila
panorama correspondiente de forma idempotente (clave: nombre de campaña).
**Único camino de escritura a Notion es `notion_publish.py`** — no editar
las tablas panorama a mano.

---

## Estado actual

<!-- AUTO:start — regenerado por sync_context.py, no editar -->
_Último sync: 2026-08-14_

**Repo:** commit=`256ec88` · branch=`fuzzing` · cambios sin commitear

**Última campaña por RQ:**
- RQ1: `rq1_effect/iv_feedback/2026-08-12_10x1200s_SFPBQN-no-grammar-no-sleep/none`
- RQ2: `rq2_overhead/micro/full`
- RQ3: _(sin campañas)_

**Tabla resumen (última campaña RQ1):**

| Trial | Execs | Hits | Hit % | Exec/s |
|------:|------:|-----:|------:|-------:|
| 1 | 348965 | 65929 | 18.9% | 297.5 |
| 2 | 620210 | 74650 | 12.0% | 528.2 |
| 3 | 527677 | 76184 | 14.4% | 450.2 |
| 4 | 612157 | 117261 | 19.2% | 522.7 |
| 5 | 699913 | 120018 | 17.2% | 595.9 |
| 6 | 426866 | 70923 | 16.6% | 365.6 |
| 7 | 518161 | 104314 | 20.1% | 441.4 |
| 8 | 439129 | 83560 | 19.0% | 374.0 |
| 9 | 692442 | 82795 | 12.0% | 592.8 |
| 10 | 698845 | 99115 | 14.2% | 597.6 |
| **Mean** | **558436.5** | **89474.9** | **16.4%** | |
| **Total (campaign)** | **5584365** | **894749** | **16.0%** | |
| Metric | Instrumented | Plain |
|--------|-------------|-------|
| Total execs (campaign) | — | 5584365 |
| Total hits (campaign) | — | 894749 |
| Campaign hit rate | — | 16.0% |
| Mean execs/trial | — | 558436.5 |
| Mean hits/trial | — | 89474.9 |
| Mean hit rate | — | 16.4% |
| Best hit rate | — | 20.1% |
| Worst hit rate | — | 12.0% |
| Best/worst ratio | — | 1.68× |
<!-- AUTO:end -->

### Conclusión activa (a mano)

No hay evidencia sólida de que el IV-feedback mejore la tasa de hit
(hits/execs) por encima de plain AFL. El hallazgo consistente es que el abort
temprano (`stop-v`) multiplica el throughput de ejecuciones, produciendo más
hits absolutos sin mejorar la eficiencia por ejecución. `fb_only` supera en
hit-rate a `fb_stop`, sugiriendo que el confound dominante es el abort, no el
feedback.
