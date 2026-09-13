@echo off
setlocal
cd /d "%~dp0"

where py >nul 2>nul
if not errorlevel 1 goto use_py

where python >nul 2>nul
if not errorlevel 1 goto use_python

echo Python was not found. Opening the local page directly...
explorer.exe "%~dp0index.html"
exit /b 0

:use_py
start "differential-sheet-server" cmd /k "py -m http.server 8000"
goto open_page

:use_python
start "differential-sheet-server" cmd /k "python -m http.server 8000"

:open_page
timeout /t 2 /nobreak >nul
explorer.exe "http://127.0.0.1:8000/index.html"
endlocal
