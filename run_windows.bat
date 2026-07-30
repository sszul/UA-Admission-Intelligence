@echo off
setlocal EnableExtensions
chcp 65001 >nul
cd /d "%~dp0"
title UA Admission Intelligence

echo ============================================================
echo UA Admission Intelligence 1.0.0
echo ============================================================
echo.

where py >nul 2>&1
if not errorlevel 1 (
  set "PYTHON=py -3"
) else (
  where python >nul 2>&1
  if errorlevel 1 (
    echo HATA: Python bulunamadi.
    echo Python 3.11 veya yenisini https://www.python.org/downloads/ adresinden kurun.
    echo Kurulumda Add Python to PATH secenegini isaretleyin.
    echo.
    pause
    exit /b 1
  )
  set "PYTHON=python"
)

if not exist ".venv\Scripts\python.exe" (
  echo Sanal ortam olusturuluyor...
  %PYTHON% -m venv .venv
  if errorlevel 1 goto :error
)

echo Gerekli paketler kontrol ediliyor...
".venv\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 goto :error
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto :error

echo.
echo Uygulama baslatiliyor: http://127.0.0.1:5000
echo Bu pencereyi uygulamayi kapatmak istediginizde kapatin.
echo.
start "" http://127.0.0.1:5000
".venv\Scripts\python.exe" -m waitress --listen=127.0.0.1:5000 wsgi:app
exit /b 0

:error
echo.
echo KURULUM VEYA CALISTIRMA HATASI
 echo Internet baglantinizi ve Python kurulumunu kontrol edin.
echo Yukaridaki hata metninin ekran goruntusunu alin.
echo.
pause
exit /b 1
