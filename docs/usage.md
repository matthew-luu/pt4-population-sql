# Usage

This document explains how to use `pt4-population-sql` to build a population dataset from a PokerTracker 4 PostgreSQL database.

Because local environments vary, the exact commands may differ slightly from one setup to another.

---

## Prerequisites

You generally need:

- PostgreSQL installed and accessible
- access to a PokerTracker 4 database
- permission to create views and materialized views
- the SQL files from this repository

---

## Typical Workflow

### 1. Point at the PT4 database

Ensure your scripts or SQL session are targeting the correct PokerTracker 4 database.

---

### 2. Build the SQL objects

Run the repository build script or execute the SQL files that create:

- schemas
- views
- materialized views
- helper functions

```Powershell
.\scripts\build.sql
```

---

### 3. Refresh materialized views

If the repository uses materialized views, refresh them after creation or after new PT4 data is imported.

```Powershell
.\scripts\refresh.sql
```

---

### 4. Validate the output

Inspect the resulting population tables or views to confirm that:

- counts are nonzero where expected
- frequencies are in valid ranges
- node families were populated correctly

---

### 5. Export or consume the data

Use one of the following approaches:

- export to CSV
- connect directly from the C# project
- inspect via SQL during development

---

## Validation Checklist

Before using the dataset downstream, verify:

- opportunities are plausible
- fold / call / raise frequencies sum appropriately for each node family
- sample sizes are large enough for the intended analysis
- limit filters or stake filters are correct

---

## Companion Repository

The generated population dataset is intended to be consumed by:

**`pt4-population-csharp`**

That repository performs range approximation and exploit analysis on top of the outputs built here.