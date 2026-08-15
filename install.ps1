$ErrorActionPreference = "Stop"

$repo = "https://github.com/Mo7ammedFawzy/opencode-template.git"
$temp = Join-Path $env:TEMP "opencode-template"

Write-Host "Installing OpenCode template..." -ForegroundColor Cyan

if (Test-Path $temp) {
    Remove-Item $temp -Recurse -Force
}

git clone --depth 1 $repo $temp | Out-Null

# AGENTS.md
Copy-Item "$temp\AGENTS.md" ".\AGENTS.md" -Force

# .agents/
if (Test-Path "$temp\.agents") {
    Copy-Item "$temp\.agents" ".\.agents" -Recurse -Force
}

# .opencode/
if (Test-Path "$temp\.opencode") {
    Copy-Item "$temp\.opencode" ".\.opencode" -Recurse -Force
}

# skills-lock.json
if (Test-Path "$temp\skills-lock.json") {
    Copy-Item "$temp\skills-lock.json" ".\skills-lock.json" -Force
}

Remove-Item $temp -Recurse -Force

Write-Host ""
Write-Host "OpenCode template installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed:"
Write-Host "  AGENTS.md"
Write-Host "  .agents/"
Write-Host "  .opencode/"
Write-Host "  skills-lock.json"