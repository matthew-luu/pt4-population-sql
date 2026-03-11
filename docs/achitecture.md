# Architecture

`pt4-population-sql` is organized as a data pipeline that converts PokerTracker 4 records into aggregated population statistics.

---

## High-Level Architecture

```text
PokerTracker 4 Database
        ↓
Source tables / derived PT4 data
        ↓
SQL logic
  - views
  - materialized views
  - functions
        ↓
Population counts
        ↓
Population frequencies
        ↓
Exportable dataset
```

---

## Architectural Role

This repository is the **data preparation layer** of the broader Poker.RangeApprox system.

It is responsible for:

- extracting relevant preflop action data
- counting opportunities correctly
- grouping data into meaningful decision nodes
- computing frequencies from counts
- exposing stable downstream inputs

It is not responsible for:

- approximating explicit hand ranges
- computing EV
- choosing exploit strategies
- presenting GUI results

Those responsibilities belong to the companion C# repository.

---

## Core Layers

### 1. Source Layer

The source layer consists of PokerTracker 4 PostgreSQL tables and any PT4-derived structures needed for analysis.

This is the raw historical data.

---

### 2. Aggregation Layer

This layer computes raw counts such as:

- opportunities to open
- number of opens
- opportunities to defend
- fold / call / raise counts
- opportunities to continue vs 3-bets

This is the most sensitive part of the pipeline because incorrect opportunity logic leads to misleading frequencies.

---

### 3. Frequency Layer

This layer converts counts into normalized frequencies.

Typical formula:

```text
frequency = action_count / opportunity_count
```

Examples include:

- RFI frequency
- fold-to-open frequency
- call-vs-open frequency
- 3-bet-vs-open frequency

---

### 4. Export Layer

The export layer exposes the final population dataset to downstream consumers.

Depending on the workflow, that may be:

- queried directly from PostgreSQL
- exported to CSV
- used by a local application pipeline

---

## Design Principles

### Correct opportunity accounting

Population frequencies are only meaningful when action counts are divided by the correct opportunities.

### Reproducibility

A dataset should be rebuildable from the source database using deterministic SQL logic.

### Separation of concerns

This repository focuses only on population extraction and aggregation.  
Exploit modeling is handled elsewhere.

### Extensibility

New node families or frequency types should be addable without redesigning the entire pipeline.