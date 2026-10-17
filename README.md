# Talking to Machines: LLMSS 2026 Workshops

Materials of the three **Talking to Machines** workshops held before the LLMSS 2026
conference at City University of Hong Kong, 13 October 2026: digital twins,
silicon samples and silicon audiences, in R.

**Read the notebooks online:** <https://talking-to-machines.github.io/llmss-2026-workshops/>

| Folder | Workshop | Notebooks |
|---|---|---|
| `W1_aipop` | Workshop 1 · AIPOP: AI polling and MrP | 3 |
| `W2_twins` | Workshop 2 · The Wisdom of Digital Twins | 2 |
| `W3_audience` | Workshop 3 · The Silicon Audience: Silicon Voters | 1 |
| `W3_legal` | Workshop 3 · The Silicon Audience: Silicon Jury | 1 |

Every notebook ships with stored model answers and runs start to finish with no
network and no API key. To run them, see
[Run it yourself](https://talking-to-machines.github.io/llmss-2026-workshops/setup.html).

## Building the site

The site is a Quarto website rendered into `docs/` from frozen results
(`_freeze/`), and GitHub Pages serves `docs/`. After changing a notebook, run
`quarto render` from this folder and commit `docs/` and `_freeze/` with it.

## Licence

Code: MIT (`LICENSE`). Text, figures and data: CC BY 4.0 (`LICENSE-CONTENT.md`),
except where a data file's README says otherwise.

## Instructors

Ray Duch (Nuffield College, Oxford), Matías Fuentes Becerra (University
of Chile), Laurenz Günther (Toulouse School of Economics).
