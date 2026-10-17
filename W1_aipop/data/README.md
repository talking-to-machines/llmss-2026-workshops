# Workshop 1 — data

The frame and donor files come from public sources: the ACS, the CES and
certified election results. The Ohio panel files come from the
**Talking to Machines** digital-twin panels, which are built on state voter
files; they are **aggregates** (district, county, cell or group totals), never an
individual.

| File | Source | Used in |
|---|---|---|
| `SF_OH.parquet` | Stage-1 frame: ACS 2019–23 five-year PUMS, adults 18+, allocated PUMA → tract → district. 23,798 cells. | Notebook 1: Section 1 |
| `SF_extended_OH.parquet` | Stage-2 frame: the same cells extended with the four 2024 vote classes by a CES-2024 multinomial model, post-stratified and raked to certified district results. 9,467 cells. | Notebook 1: Sections 2–5, 7; Notebook 3: Sections 1, 3, 5–6 |
| `predictor_cd119_2024.csv` | Certified 2024 presidential results by 119th-Congress district (Daily Kos Elections compilation, via `ccesMRPprep::cd_info_2024`), plus CVAP and the stay-home share. All 161 districts in the frame. | Notebook 1: Section 3; Notebook 3: Sections 1, 4 |
| `oh_county_certified_2024.csv` | Certified 2024 county returns for Ohio's 88 counties. MIT Election Data and Science Lab, *County Presidential Election Returns 2000–2024*, doi:10.7910/DVN/VOQCHQ. | Notebook 2: Section 6; Notebook 3: Sections 1, 5–6 |
| `oh_ces_donors.parquet` | The donor pool: all 10,222 Ohio respondents to the Cooperative Election Study 2020–2025 (Harvard Dataverse), with their matching keys, 2024 vote class, and the **donor half of the persona** already rendered (values and politics, 53 harmonised issue items, circumstances and beliefs, media diet), using the same template as the Talking to Machines Ohio panel. | Notebook 2: Sections 2–4 |
| `oh_syn_interviews.jsonl` | The cached vote-module answers for the 400 twins of the seeded draw, so Notebook 2 runs offline. One line per twin, keyed by twin and donor. | Notebook 2: Section 5 |
| `oh_targets_statewide.csv` | The **hybrid** target frame of the Talking to Machines Ohio panel, by district × county × sex × ethnicity × age: cell sizes from the ACS, the voter/stay-home split from the state voter file, the D/R split from the stage-2 model and registrants' primary records, raked to certified results. | Notebook 1: Section 7 |
| `oh_checks_statewide.txt` | The acceptance report of the Talking to Machines Ohio panel: county calibration, margins, composition, provenance counts, primary-ballot and turnout-history cross-tabs. The answer key for the audit exercise. This copy is edited: file paths are removed, and so is the report's frame-versus-file turnout block, whose file-side counts came from the draw pool and were never scaled up to the full file. Notebook 1, Section 7 computes that comparison directly instead. | Notebook 1: Section 7 |
| `oh_pmap.csv` | Per-registrant partisan propensity, P(2024 vote class \| registration × primary record), estimated from the CES 2024 validated file. Ohio's is keyed on the **primary ballot**, since Ohio records no party registration. | Notebook 1: Section 7 |
| `benchmark_ohio.csv` | Vote-module results for the three Ohio Talking to Machines panels (statewide, OH-07, OH-09): 2024 recall against the certified result, 2026 intention against the polls, with each poll's source. | Notebook 2: Section 6; Notebook 3: Section 6 |

**Not in this repository.** Notebook 3, Section 7 also reads four files: `benchmark_12panels.csv` (all twelve panels, in six states) and the three `nj2025_holdout_*.csv` files (the New Jersey held-out test). The non-Ohio panel results carry non-commercial terms, so they are not public. The website version of Notebook 3 shows their output; without them, the Section 7 blocks are skipped.

## Public sources

- **ACS** 2019–2023 five-year PUMS, US Census Bureau.
- **CES** 2020–2025, Cooperative Election Study, Harvard Dataverse.
- **Certified results**: Daily Kos Elections district compilation; MIT Election
  Data and Science Lab county returns, doi:10.7910/DVN/VOQCHQ.
- **2026 polls**: RealClearPolitics and the other sources named in
  `benchmark_ohio.csv`.
