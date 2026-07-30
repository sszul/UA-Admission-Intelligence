@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0"
title UA Admission Intelligence

echo Python kontrol ediliyor...
where py >nul 2>&1
if errorlevel 1 (
  where python >nul 2>&1
  if errorlevel 1 (
    echo Python bulunamadi. Python 3.11 veya ustunu kurun ve "Add Python to PATH" secenegini isaretleyin.
    echo https://www.python.org/downloads/windows/
    pause
    exit /b 1
  )
  set PYTHON=python
) else (
  set PYTHON=py
)

if not exist ".venv\Scripts\python.exe" (
  echo Sanal ortam olusturuluyor...
  %PYTHON% -m venv .venv || goto ERROR
)

echo Paketler kuruluyor veya guncelleniyor...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt || goto ERROR

echo Tarayici aciliyor...
start "" http://127.0.0.1:5000

echo Uygulama calisiyor. Kapatmak icin bu pencereyi kapatin.
".venv\Scripts\python.exe" -m waitress --listen=127.0.0.1:5000 wsgi:app
exit /b 0

:ERROR
echo Kurulum veya calistirma sirasinda hata olustu.
pause
exit /b 1
