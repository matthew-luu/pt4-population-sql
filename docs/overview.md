# Overview

`pt4-population-sql` is the population-statistics layer for the Poker.RangeApprox project.

Its purpose is to transform raw PokerTracker 4 hand-history data into aggregated preflop statistics that describe how a player population behaves.

These statistics are later consumed by the C# exploit engine.

---

## Problem This Repository Solves

PokerTracker 4 stores large volumes of hand-level data, but exploit modeling requires summary statistics such as:

- how often a position opens
- how often defenders fold, call, or 3-bet
- how often players continue vs 3-bets
- how many opportunities existed for a given action

Those statistics must be computed from the underlying hand data in a reproducible way.

This repository provides that transformation.

---

## What “Population Data” Means Here

Population data refers to aggregate behavior observed across a set of hands.

Examples:

- Button open frequency
- Small blind defense vs Button open
- Hijack response vs cutoff 3-bet
- node-family frequencies pooled across many opportunities

These values are descriptive statistics of the player pool, not equilibrium solutions.

---

## Why This Matters

The companion exploit engine does not operate directly on raw PT4 tables.

Instead, it needs normalized statistical inputs such as:

- action frequencies
- opportunity counts
- grouped node-family aggregates

Without this repository, the exploit engine would have no stable population model to consume.

---

## Repository Role in the Overall Project

```text
Raw PT4 hand data
        ↓
Population SQL aggregation
        ↓
Counts and frequencies
        ↓
Exportable dataset
        ↓
Exploit modeling in C#
```

---

## Main Outputs

This repository produces data suitable for:

- CSV export
- direct PostgreSQL consumption
- downstream range approximation
- exploit EV calculations

The exact exported structure can evolve, but the core idea remains the same:  
convert PT4 observations into a usable population model.