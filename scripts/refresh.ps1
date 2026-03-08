param(
  [string]$Db = "PT4 DB",
  [string]$DbHost = "localhost",
  [string]$User = "postgres"
)

& psql `
  -h $DbHost `
  -U $User `
  -d $Db `
  -f "sql/refresh.sql" `
  -v ON_ERROR_STOP=1