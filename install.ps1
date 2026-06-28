# LogSense AI - Windows PowerShell Installer
Write-Host ""
Write-Host "  ====================================" -ForegroundColor Cyan
Write-Host "   LogSense AI - Windows Installer" -ForegroundColor Cyan
Write-Host "  ====================================" -ForegroundColor Cyan
Write-Host ""

try { python --version | Out-Null; Write-Host "  Python found!" -ForegroundColor Green }
catch {
    Write-Host "  Installing Python..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe" -OutFile "python_installer.exe"
    Start-Process python_installer.exe -Args "/quiet InstallAllUsers=1 PrependPath=1" -Wait
    Remove-Item python_installer.exe
}

try { git --version | Out-Null; Write-Host "  Git found!" -ForegroundColor Green }
catch {
    Write-Host "  Installing Git..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe" -OutFile "git_installer.exe"
    Start-Process git_installer.exe -Args "/VERYSILENT /NORESTART" -Wait
    Remove-Item git_installer.exe
}

if (-Not (Test-Path "logsense")) {
    git clone https://github.com/HARSHITRAJPUT81/logsense.git
}

Set-Location logsense
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt -q
pip install -e . -q

Write-Host ""
Write-Host "  You need a FREE Groq API key" -ForegroundColor Cyan
Write-Host "  1. Go to: https://console.groq.com"
Write-Host "  2. Sign up free with Google"
Write-Host "  3. Click API Keys - Create API Key"
Write-Host "  4. Copy key starting with gsk_..."
Write-Host ""
$GROQ_KEY = Read-Host "  Paste your Groq API key"

"GROQ_API_KEY=$GROQ_KEY" | Out-File .env -Encoding utf8
"LOGSENSE_MODEL=claude-sonnet-4-6" | Out-File .env -Append -Encoding utf8
"LOGSENSE_DB=$env:USERPROFILE\.logsense\history.db" | Out-File .env -Append -Encoding utf8

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
[Environment]::SetEnvironmentVariable("PATH", "$currentPath;$(Get-Location)\venv\Scripts", "User")

Write-Host ""
Write-Host "  ====================================" -ForegroundColor Green
Write-Host "   LogSense AI installed successfully!" -ForegroundColor Green
Write-Host "  ====================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Commands:" -ForegroundColor Cyan
Write-Host "  logsense analyze $env:SystemRoot\System32\winevt\Logs\System.evtx" -ForegroundColor Yellow
Write-Host "  logsense analyze $env:SystemRoot\System32\winevt\Logs\Application.evtx" -ForegroundColor Yellow
Write-Host "  logsense report" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Restart PowerShell before using logsense!" -ForegroundColor Red
