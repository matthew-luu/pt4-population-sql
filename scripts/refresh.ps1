param(
  [string]$Db = "PokerTracker4",
  [string]$Host = "localhost",
  [string]$User = "postgres"
)

psql -h $Host -U $User -d $Db -f scripts/refresh.sql -v ON_ERROR_STOP=1