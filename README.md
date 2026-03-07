# pt4-population-sql

SQL utilities for analyzing **population tendencies in PokerTracker 4 databases**.

This project builds PostgreSQL views and queries designed to extract population-level statistics (e.g., RFI frequencies, positional tendencies, and other preflop metrics) from a PokerTracker 4 database.

The goal is to support **data-driven exploitative strategies** by analyzing how the player pool behaves rather than relying solely on theoretical models.

---

# Features

- Population-level preflop statistics
- Position-based RFI frequencies
- PostgreSQL views for quick querying
- Automated build scripts
- Compatible with PokerTracker 4 PostgreSQL databases

Example outputs include:

- RFI by position
- 2bet response frequencies by position vs opens by position

---

# Requirements

- PokerTracker 4
- PostgreSQL
- `psql` command line client
- PowerShell (for build scripts)

PokerTracker installs PostgreSQL automatically, so most users already have a compatible environment.

---

# Setup

### 1. Install PostgreSQL CLI

Ensure `psql` is available.

Test with:

psql --version


If not available, install PostgreSQL client tools or add them to your PATH.
```powershell
.\scripts\install_psql.ps1
```
---

### 2. Configure your database connection

Edit the PowerShell script parameters if needed.

Example defaults:

Database: PT4 DB
Host: localhost
User: postgres

---

### 3. Build database objects

Run:
```powershell
.\scripts\build.ps1
```
This will:

- Connect to your PokerTracker database
- Execute `scripts/build.sql`
- Create all views and objects used for analysis

---

# Example Usage

Query population statistics:

```sql
SELECT
	p.limit_name as "limit",
	p.player_count as players,
	p.total_hands as hands,
    p.rfi_utg AS ep,
    p.rfi_hj AS mp,
    p.rfi_co AS co,
    p.rfi_btn AS btn,
    p.rfi_sb AS sb
FROM
    pop.v_population_preflop p
WHERE
    p.id_limit = 2;
```
```
| limit | players | hands  | ep      | mp     | co     | btn     | sb     |
| ----- | ------- | ------ | ------- | ------ | ------ | ------- | ------ |
| NL2   | 412     | 120000 | 15.2    | 19.1   | 27.4   | 44.0    | 38.5   |
```
Example queries can be found in \sql\30_queries

These values can be used to:
- Compare pool tendencies against GTO baselines
- Identify exploit opportunities
- Track changes across stakes