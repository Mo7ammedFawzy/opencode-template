$ErrorActionPreference = "Stop"

$repo = "https://github.com/Mo7ammedFawzy/opencode-template.git"
$temp = Join-Path $env:TEMP "opencode-template-vue"

Write-Host ""
Write-Host "Installing OpenCode Vue preset..." -ForegroundColor Cyan
Write-Host ""

# Clean previous temporary directory
if (Test-Path $temp) {
    Remove-Item $temp -Recurse -Force
}

# Clone repository
Write-Host "Downloading template..." -ForegroundColor DarkGray
git clone --depth 1 $repo $temp | Out-Null

$preset = Join-Path $temp "presets\vue"

if (-not (Test-Path $preset)) {
    throw "Vue preset was not found at $preset"
}

# Copy AGENTS.md
Write-Host "Installing AGENTS.md..." -ForegroundColor DarkGray
Copy-Item "$preset\AGENTS.md" ".\AGENTS.md" -Force

# Copy .agents/
Write-Host "Installing .agents/..." -ForegroundColor DarkGray

if (Test-Path "$preset\.agents") {
    New-Item -ItemType Directory -Force ".\.agents" | Out-Null
    Copy-Item "$preset\.agents\*" ".\.agents\" -Recurse -Force
}

# Copy .opencode/
Write-Host "Installing .opencode/..." -ForegroundColor DarkGray

if (Test-Path "$preset\.opencode") {
    New-Item -ItemType Directory -Force ".\.opencode" | Out-Null
    Copy-Item "$preset\.opencode\*" ".\.opencode\" -Recurse -Force
}

# Cleanup
Remove-Item $temp -Recurse -Force

Write-Host ""
Write-Host "Vue OpenCode preset installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed:"
Write-Host "  AGENTS.md"
Write-Host "  .agents/"
Write-Host "  .opencode/"
Write-Host ""