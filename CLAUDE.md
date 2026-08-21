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
_Último sync: 2026-08-21_

**Repo:** commit=`64b5a2e` · branch=`fuzzing` · cambios sin commitear

**Última campaña por RQ:**
- RQ1: `rq1_effect/iv_feedback/2026-08-21_smoketest_multivariant/none`
- RQ2: `rq2_overhead/micro/full`
- RQ3: _(sin campañas)_

**Tabla resumen (última campaña RQ1):**

| Trial | Execs | Hits | Hit % | Exec/s |
|------:|------:|-----:|------:|-------:|
| 1 | 1187 | 301 | 25.4% | 27.6 |
| 2 | 2118 | 614 | 29.0% | 51.7 |
| **Mean** | **1652.5** | **457.5** | **27.2%** | |
| **Total (campaign)** | **3305** | **915** | **27.7%** | |
| Metric | Instrumented | Plain |
|--------|-------------|-------|
| Total execs (campaign) | — | 3305 |
| Total hits (campaign) | — | 915 |
| Campaign hit rate | — | 27.7% |
| Mean execs/trial | — | 1652.5 |
| Mean hits/trial | — | 457.5 |
| Mean hit rate | — | 27.2% |
| Best hit rate | — | 29.0% |
| Worst hit rate | — | 25.4% |
| Best/worst ratio | — | 1.14× |
<!-- AUTO:end -->

### Conclusión activa (a mano)

El hallazgo consistente sigue siendo que el abort temprano (`stop-v`) multiplica el throughput de ejecuciones, produciendo más hits absolutos sin mejorar la eficiencia por ejecución. `fb_only` supera en hit-rate a `fb_stop`, sugiriendo que el confound dominante es el abort, no el feedback. 
14/08
Además pareciera que solo se ve esta mejora cuando el programa realiza operaciones más costosas. Por ahora lo estaba simulando con sleep, pero ahora tengo ganas de ver si con escenarios de cat reales podría pasar, por lo que obligue al fuzzer a usar archivos de 1 mega sobre los cuales correr los comandos que fuzzea. Tampoco veo mucha diferencia con ningún tipo de feedback, habría que realizar un análisis estadístico más sólido, para saber que tan significativos son los resultados obtenidos.
18/08
Después de correr el heavy operations long no veo mucha mejora en los reusltados, Ni siquiera para stop V. Puede que tenga que ver con que los caminos que dan IV también son costosos.
21/08
Probando nuevo commit de cat, para ver que pasa