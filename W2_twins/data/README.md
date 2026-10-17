# Workshop 2 — data

The twins' answers come from the finfluencer panel of **Talking to Machines**:
digital twins of financial influencers on X, interviewed every trading day with
`gpt-5-mini`. The files hold **aggregates** (stock × day totals) and twins'
answers under anonymous ids, never an influencer's name or posts. The one
exception is a stored deliberation session (the last two files below): twins'
posts, with names and hashtags removed.

| File | What it holds | Used in |
|---|---|---|
| `ff_persona_cards.csv` | Ten anonymous profile cards, `ff01`–`ff10`: year the account opened, followers and posts (rounded), paid badge, and a short written summary of the bio, focus, audience and recent posts. No names, handles or quoted posts. | Notebook 1: Sections 1–3 |
| `ff_prompts.json` | The panel's daily stock-pick interview prompts, word for word from the public `ai-population` repository, plus the workshop's system prompt (the same, without the web-search paragraph). | Notebook 1: Sections 2–3 |
| `ff_interviews_slice.csv` | The ten twins' archived answers on the 20 largest stocks over the last 20 trading days of the panel (14 August to 14 September 2026): recommendation, confidence, speculation, holding period, catalyst and explanation. Names and links are removed from the explanations. | Notebook 1: Sections 2, 4–6 |
| `ff_live_example_ffNN.txt` | One live interview per teaching twin, run before the workshop exactly as in Notebook 1, Section 3. Used when no API key is set. | Notebook 1: Sections 3, 5 |
| `ff_signal_panel.csv` | One row per stock × trading day, 25 June to 14 September 2026: 100 large US stocks (the largest S&P 500 companies by market value on 1 June 2026), about 85 twins per row. Columns: `n_twins`, `mean_rec` (average 0–100 rating), `sd_rec`, `buy_share` (rating ≥ 65), `sell_share` (≤ 35), `net_buy_share`, `mean_conf`. An interview after 15:30 New York time counts for the next trading day; a twin interviewed twice on a day counts once (the later interview). | Notebook 2: Sections 1–4 |
| `ff_excess_returns.csv` | One row per stock × trading day, 1 June to 29 September 2026: the day's log return minus the S&P 500's (`^GSPC`), computed from Yahoo Finance adjusted closing prices. | Notebook 2: Sections 1, 3–4 |
| `ff_prediction_markets.csv` | One row per twin × event: 76 twins interviewed on 21 April 2026 about 17 events traded on Polymarket. `twin_prob` is the twin's probability; `market_prob` the Polymarket price shown to the twin in the question (blank where none was shown); `outcome` the settled result (1 = happened, 0 = did not), blank if not settled by 14 August 2026. | Notebook 2: Section 5 |
| `ff_deliberation_posts.csv` | One row per agent × round of a stored multi-agent deliberation from the Market Signal project (28 September 2026, `gpt-4.1-mini`): ten finfluencer twins, renamed Agent A–J, four rounds. Columns: style, `contrarian` (the designated devil's advocate), how many posts the agent had seen, its buy and sell picks with ratings, confidence, and its post with names and hashtags removed. | Notebook 2: Section 6 |
| `ff_deliberation_session.json` | The same session's settings (model, temperatures, length, cost), the instruction given in each round word for word, and the session's own closing summary. Persona profiles, the market brief and full prompts are not included. | Notebook 2: Section 6 |

## Sources

- **Returns:** Yahoo Finance daily adjusted closes.
- **Prediction markets:** Polymarket contract prices and settlements.
- **Deliberation:** Talking to Machines, Market Signal multi-agent deliberation (book V4).
