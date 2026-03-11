# Data Pipeline

This document explains how raw PokerTracker 4 data is transformed into population statistics.

---

## Pipeline Summary

```text
PT4 hand data
        ↓
identify preflop decision nodes
        ↓
count opportunities
        ↓
count actions
        ↓
compute frequencies
        ↓
store / export population dataset
```

---

## Step 1: Identify Decision Nodes

The first step is to identify the preflop spots to be modeled.

Examples of node families include:

- RFI opportunities by position
- response vs open
- response vs 3-bet
- response vs 4-bet

A node family represents a repeated strategic situation observed across many hands.

---

## Step 2: Count Opportunities

For each node, the pipeline counts how many times a player had the opportunity to take an action.

Examples:

- how many times BTN had the opportunity to open
- how many times SB faced a BTN open
- how many times an opener faced a 3-bet

Opportunity counting is foundational because all frequencies are derived from it.

---

## Step 3: Count Actions

Once opportunities are known, the pipeline counts observed actions.

Examples:

- open
- fold
- call
- 3-bet
- 4-bet
- continue vs 3-bet

These counts are usually grouped by:

- position
- opposing position
- limit or stake grouping
- node family

---

## Step 4: Convert Counts to Frequencies

Frequencies are calculated from counts.

Basic formula:

```text
action_frequency = action_count / opportunity_count
```

Examples:

```text
rfi_freq = open_count / open_opportunities
fold_vs_open_freq = fold_count / defend_opportunities
threebet_vs_open_freq = threebet_count / defend_opportunities
```

---

## Step 5: Expose the Dataset

The final dataset is exposed in a format suitable for the exploit engine.

Typical downstream fields include:

- node identifier or node family
- acting position
- facing position
- action frequencies
- opportunity counts
- metadata such as limit or blind level

---

## Why Opportunity Counts Matter

A frequency without its sample size can be misleading.

For example:

- a 20% 3-bet frequency over 20 opportunities is weak evidence
- a 20% 3-bet frequency over 20,000 opportunities is strong evidence

This repository therefore treats counts and frequencies as paired information.

---

## Node-Family Thinking

A useful design approach is to think in terms of **node families** instead of isolated actions.

Example:

- “vs open” is a family
- within that family, the actions may be fold / call / 3-bet

This makes the exported population data easier to consume and reason about in the exploit engine.