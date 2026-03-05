param(
  [string]$Db = "PT4 DB",
  [string]$DbHost = "localhost",
  [string]$DbUser = "postgres"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
  throw "psql not found. Run .\scripts\install_psql.ps1 first."
}

Write-Host "Building database objects..."

psql -h $DbHost -U $DbUser -d $Db -f scripts/build.sql -v ON_ERROR_STOP=1