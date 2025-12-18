Param(
  [string]$Image = 'mcr.microsoft.com/playwright:latest',
  [string]$PlaywrightVersion = '1.46.1'
)

$ErrorActionPreference = 'Stop'

# Runs Playwright smoke checks in a Linux container (Docker Desktop -> Linux engine).
# Output: "UI SMOKE: PASS" or fails with a stack trace.

$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

# Quick preflight
try {
  docker version | Out-Null
} catch {
  throw "Docker is not available. Start Docker Desktop and ensure the Linux engine is enabled (Context: desktop-linux)." 
}

Write-Host "Running UI smoke in container..." -ForegroundColor Cyan
Write-Host "- Site root: $root"
Write-Host "- Image: $Image"
Write-Host "- Playwright npm: playwright@$PlaywrightVersion"

# Install playwright into /tmp inside the container to keep the repo clean.
$cmd = @(
  'docker', 'run', '--rm',
  '-v', "${root}:/work",
  '-w', '/work',
  $Image,
  'bash', '-lc',
  "set -e; mkdir -p /tmp/pw; cd /tmp/pw; npm init -y >/dev/null; npm i playwright@$PlaywrightVersion >/dev/null; NODE_PATH=/tmp/pw/node_modules node /work/tools/ui_smoke_playwright.js"
)

& $cmd[0] $cmd[1..($cmd.Length-1)]
