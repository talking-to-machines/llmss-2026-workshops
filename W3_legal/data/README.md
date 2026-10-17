# W3_legal/data — provenance

Every file the notebook reads sits here; nothing is downloaded at run time.

| File | What | Source |
|---|---|---|
| `cases.csv` | the two cases: `landor` (practice, decided) and `johnson` (live, argued 5 Oct 2026) | project |
| `landor_packet.md`, `johnson_packet.md` | the case packet as the twin receives it (everything above the harness notes) | `validation_packets/ot2025/packets/`, `validation_packets/ot2026/packets/` |
| `landor_evidence.json`, `johnson_evidence.json` | per Justice: the 8 retrieved passages, the context blocks, the retrieved-set hash, and the exact system and user messages | exported by the organisers from the project's retrieval index of Supreme Court documents, `max_term = 2024` |
| `mq_ot2024.csv` | Martin–Quinn posterior means and 95% intervals, October Term 2024, for the nine sitting Justices | official 2024 release, `Data/MQ/mq_justices_2024release.csv` |
| `landor_outcome.csv`, `landor_outcome_note.txt` | how each Justice voted in Landor (majority/minority) and the disposition | Oyez decision record; draft answer key, verified against the slip opinion before the freeze |
| `johnson_crowd.csv` | FantasySCOTUS crowd prediction for Johnson as of 1 Oct 2026 | fantasyscotus.net case list, snapshot |
| `cached_answers.json` | the nine twins' answers on both cases from the project's own run (added after 3 Oct) | Laurenz Günther's harness run, Opus 5.5 pinned snapshot; `runs/<run_id>/` in `corpus_drops/scotus_v3/` |

Rules. The evidence files contain only passages from October Terms 1991–2024; nothing from the term being
predicted, nothing from the case at issue. The Landor outcome file is the only post-decision material in the
folder and it is read only in Section 6, after the twin has answered. The packets contain nothing that reveals an
outcome and were checked by a person.

`cached_answers.json` layout: `{"model_id": "...", "run_id": "...", "landor": {"<justice>": {answer JSON}, ...}, "johnson": {...}}`.
