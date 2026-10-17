# W3_legal — the legal-twins notebook (Silicon Jury block, Workshop 3)

One notebook, 25 minutes hands-on: a participant runs one justice twin on one case by hand, with the retrieval
already done, compares it with the full bench and with the Court (practice case) or the crowd (live case), then
changes one input and sees what moves.

```
W3_legal/
  run_all.R                 checks packages, renders the notebook
  notebooks/01_justice_twins.Rmd
  data/                     everything the notebook reads, with a provenance README
  figures/pipeline_map.png  the pipeline panel of the Silicon Bench Map
  output/                   what the notebook writes (participants' own answers)
```

The notebook runs start to finish with no network and no key. The full bench's answers for both cases, the practice
case (*Landor*) and the live case (*Johnson*), are stored in `data/cached_answers.json`, from the project's own runs on
Claude Opus 5.5. Only the live step calls a model, and only if `OPENAI_API_KEY` is set.
