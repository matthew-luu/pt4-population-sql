param(
  [string]$Db = "PT4 DB",
  [string]$DbHost = "localhost",
  [string]$DbUser = "postgres"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
  throw "psql not found. Run .\scripts\install_psql.ps1 first."
}

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$exportDir = Join-Path $repoRoot "Exported Reports"
if (-not (Test-Path $exportDir)) {
  New-Item -ItemType Directory -Path $exportDir | Out-Null
}

Write-Host "Building database objects..."
psql -h $DbHost -U $DbUser -d $Db -f sql/build.sql -v ON_ERROR_STOP=1

Write-Host "Verifying database objects..."
psql -h $DbHost -U $DbUser -d $Db -f sql/verify.sql -v ON_ERROR_STOP=1

Write-Host "Exporting reports..."
psql -h $DbHost -U $DbUser -d $Db -f sql/export_reports.sql -v ON_ERROR_STOP=1

Write-Host "Done."