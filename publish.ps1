# Push everything in this folder to GitHub; Pages redeploys automatically (~1 min).
param([string]$Message = "Update site $(Get-Date -Format 'yyyy-MM-dd HH:mm')")

Set-Location $PSScriptRoot
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host "Nothing to publish."; exit 0 }
git commit -m $Message
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
git push
