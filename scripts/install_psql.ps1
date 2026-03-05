param(
  [ValidateSet("17","18")]
  [string]$Major = "17"
)

$ErrorActionPreference = "Stop"

if (Get-Command psql -ErrorAction SilentlyContinue) {
  Write-Host "psql already installed:"
  psql --version
  exit 0
}

$pkgId = "PostgreSQL.PostgreSQL.$Major"

Write-Host "Installing $pkgId via winget..."
winget install --id $pkgId --source winget --accept-package-agreements --accept-source-agreements

Write-Host "Done. Restart your terminal, then run: psql --version"