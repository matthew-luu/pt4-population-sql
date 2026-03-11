# Population Model

This repository builds a statistical model of the player pool from observed preflop actions.

The model is not a solver output and does not attempt to represent equilibrium play.  
It is an empirical description of how the population actually behaves.

---

## Core Quantities

The population model is built from two main ingredients:

1. **opportunity counts**
2. **action frequencies**

Together, they describe both:

- how often a player pool chooses an action
- how reliable that estimate is

---

## Basic Frequency Model

For a given action in a given node:

```text
frequency = action_count / opportunity_count
```

Examples include:

- RFI by position
- fold vs open
- call vs open
- 3-bet vs open
- continue vs 3-bet

---

## Why Counts and Frequencies Must Stay Together

Frequencies alone are not enough.

A statistic derived from a small sample can look extreme even when it is unstable.

Because of that, downstream consumers should treat:

- `frequency` as the estimate
- `opportunity_count` as the confidence context

This repository preserves both.

---

## Population Nodes

A population node is a repeated strategic situation.

Examples:

- BTN RFI
- SB vs BTN open
- CO vs HJ 3-bet
- opener response vs 3-bet

Each node captures a behavior slice of the population.

---

## Node Families

Related nodes can be grouped into node families for easier downstream modeling.

Examples:

- RFI family
- vs-open defense family
- vs-3-bet continue family

This grouping is useful because the C# exploit engine often consumes grouped response behavior rather than isolated counts.

---

## Limits of the Model

This repository does not infer exact hand ranges.

It only provides aggregate behavior.

For example, it can tell downstream systems that:

- BTN opens 48%
- SB folds 72% vs BTN open

It cannot directly say which exact hands make up those actions.  
That approximation happens later in the C# repository.