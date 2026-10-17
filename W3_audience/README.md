# Workshop 3 — The Silicon Audience · Silicon Voters block

One notebook, `notebooks/02_silicon_voters.Rmd`, in the same form as the morning's
notebooks and as the Silicon Jury notebook (`W3_legal/`). A language model writes
thirty-second ads aimed at five kinds of Ohio voter, and participants improve its
prompt in three stages. Every ad gets two scores: whether model judges can tell it
from a real Ohio campaign ad, and how much better it does with its own group than
with the other four.

Runs start to finish with no network and no key: Stages 1 and 2, and a worked example
of Stage 3, are a stored run.
Only Stage 3 (Section 6) calls a model, and only if `OPENAI_API_KEY` is set (the
workshop server sets it, with `OPENAI_BASE_URL` pointing at the course proxy). One
Stage 3 run is 5 + 250 + 15 = 270 calls to `gpt-5-mini`, well inside the
per-participant cap.

```
W3_audience/
  run_all.R                 renders the notebook; checks the packages
  notebooks/
    02_silicon_voters.Rmd   the notebook
  data/                     everything it reads (see data/README.md)
    oh_panel_400.parquet    the 400 Ohio twins: persona, weight, segments, ideology
    issues.csv              the issues (this block uses two)
    ads_frozen.csv          the fifteen scripts frozen with the pre-registration
    ad_answers.jsonl        those scripts put to all 400 twins (Section 3)
    real_ads_judges.jsonl   ten real campaign ads (nine Ohio, one Illinois), for the judges
    stage_ads.csv           the stored Stage 1 and 2 ads, and the Stage 3 worked example
    stage_answers.jsonl     their answers from the 50-twin audience
    stage_judges.jsonl      their judge calls
  figures/loop_map.png      Figure 2.0
  solutions/                answers to the exercises
  build/                    how the organisers made the stored files
  output/                   what the notebook writes (your Stage 3 ads, answers, leaderboard entry)
```

## Packages

`data.table`, `jsonlite`, `ggplot2`, `httr2`, `rmarkdown`, `knitr`, and `arrow` (or
`nanoparquet`) for the panel file; `digest` if present. All already required by Workshop 1.

## The declared boundary

Construction of the twins, the interview and the scoring are in this package exactly
as the group runs them. The search (how scripts are mutated and selected over
generations) and the tuning of the audience sample are not, and are shown in the
session rather than distributed. Section 7 of the notebook says so to participants.

## Provenance

- Audience: the Workshop 1 seeded 400-twin Ohio draw (`W1_aipop/output/oh_mini_panel_400_interviewed.parquet`),
  copied into `data/` by the organisers so the afternoon does not depend on the morning's `output/`.
- Question: the vote-likelihood item of the pre-registered study *Validating digital
  twins against the people they are built from* (OSF, 7 Oct 2026, DOI
  10.17605/OSF.IO/CKAM2), asked in the third person as the registration puts it.
- Real ads: seven Ohio campaign ads from Google's political-ad archive (ids in the
  file), names removed, caption errors corrected; selected by Laurenz Guenther.
- Scripts: the fifteen advertisements frozen with that registration.
- `ad_answers.jsonl`: `gpt-5-mini-2025-08-07`, reasoning effort low, one replicate, with the
  earlier first-person, four-question interview (Section 3 says so).
- Stages 1 and 2 and the worked example: `build/generate_stages.R`, which runs the notebook's own blocks, so the
  stored run uses exactly the prompts the notebook prints.
