# Schema Notes

This document describes the conceptual schema used by `pt4-population-sql`.

It is intentionally written at a repository-design level rather than as a full PT4 database reference.

---

## Conceptual Schema Layers

### Source tables

These are PokerTracker 4 tables or PT4-derived data sources that contain raw hand history information.

Typical source concepts include:

- hand metadata
- players
- positions
- actions
- blind levels
- preflop action sequences

---

### Derived views

Derived views normalize or reshape raw PT4 data into structures that are easier to aggregate.

These may include:

- preflop action summaries
- opportunity flags
- action classification fields
- node labels

---

### Materialized views

Materialized views store aggregated results for repeated analysis.

These are useful when:

- aggregation is expensive
- rebuild frequency is acceptable
- downstream querying needs to be fast

---

## Typical Output Fields

The exported population dataset may include fields such as:

- `id_limit`
- `limit_name`
- `amt_sb`
- `amt_bb`
- `position`
- `facing_position`
- `node_family`
- `opportunities`
- `fold_freq`
- `call_freq`
- `raise_freq`

Exact names depend on implementation details.

---

## Schema Design Goals

The schema should support:

- clear separation of raw data vs derived statistics
- deterministic rebuilds
- easy export
- easy consumption by the exploit engine
- expansion to new node families over time

---

## Important Design Rule

When updating the schema or adding new derived objects, preserve the distinction between:

- raw PT4 facts
- derived opportunity logic
- aggregated outputs

Mixing those concerns too early makes validation harder.