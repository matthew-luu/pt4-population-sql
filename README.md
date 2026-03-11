# pt4-population-sql

`pt4-population-sql` is the data-extraction and aggregation layer for the Poker.RangeApprox project.

It reads hand history data from a PokerTracker 4 PostgreSQL database and builds population-level preflop statistics that can be consumed by the exploit engine in the companion repository.

This repository is responsible for turning raw PT4 hand data into structured population datasets such as:

- RFI frequencies
- defense frequencies vs opens
- response frequencies vs 3-bets
- opportunity counts
- aggregated node-family statistics

The output of this repository is used by:

**`pt4-population-csharp`** — the exploit and range-approximation engine.

---

## What This Repository Does

At a high level, the pipeline is:

```text
PokerTracker 4 Database
        ↓
SQL views / materialized views / functions
        ↓
Population counts and frequencies
        ↓
Exported dataset
```

This repository does **not** generate exploit strategies directly.  
Its job is to produce clean, reproducible population statistics.

---

## Core Responsibilities

- read and aggregate PT4 data
- calculate opportunity counts for decision nodes
- calculate action counts for decision nodes
- convert counts into frequencies
- expose population data in a format usable by downstream tools

---

## Example Output

Example conceptual output row:

```text
node_family: vs_open_co
position: btn
fold_freq: 0.703
call_freq: 0.182
threebet_freq: 0.115
opportunities: 120384
```

---

## Relationship to the Companion Repository

This repository generates the population dataset consumed by:

**`pt4-population-csharp`**

That repository performs:

- range approximation
- EV calculation
- exploit strategy generation
- GUI execution and reporting

---

## Documentation

Detailed documentation is available in `docs/`:

- `docs/overview.md`
- `docs/architecture.md`
- `docs/data-pipeline.md`
- `docs/population-model.md`
- `docs/schema.md`
- `docs/usage.md`

---

## High-Level System View

```text
PokerTracker4 Database
        ↓
pt4-population-sql
        ↓
Population Dataset
        ↓
pt4-population-csharp
        ↓
Exploit Strategy Output
```

---

## Intended Audience

This repository documentation is useful for:

- developers extending the SQL pipeline
- anyone validating the population statistics
- users who want to understand how the dataset is built
- employers reviewing the data-engineering side of the project

---

## Future Work

Potential future improvements include:

- additional node families
- better abstraction of repeated SQL patterns
- more export formats
- broader validation tooling
- improved documentation of PT4 table dependencies