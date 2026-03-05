#!/usr/bin/env bash
set -euo pipefail

DB="${1:-PokerTracker4}"
HOST="${2:-localhost}"
USER="${3:-postgres}"

psql -h "$HOST" -U "$USER" -d "$DB" -f scripts/build.sql -v ON_ERROR_STOP=1