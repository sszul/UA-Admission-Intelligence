@echo off
setlocal EnableExtensions
chcp 65001 >nul
cd /d "%~dp0"
title UA Admission Intelligence

set "LOGFILE=%~dp0ua_admission_startup.log"
>"%LOGFILE%" echo UA Admission Intelligence baslatma gunlugu
>>"%LOGFILE%" echo Tarih: %DATE% %TIME%
>>"%LOGFILE%" echo Klasor: %CD%

echo ============================================================
echo UA Admission Intelligence 1.1.0
echo ============================================================
echo.

where py >nul 2>&1
if not errorlevel 1 (
  set "PYTHON=py -3"
) else (
  where python >nul 2>&1
  if errorlevel 1 goto :python_missing
  set "PYTHON=python"
)

%PYTHON% -c "import sys; raise SystemExit(0 if sys.version_info >= (3,11) else 1)" >>"%LOGFILE%" 2>&1
if errorlevel 1 goto :python_old

if exist ".venv\Scripts\python.exe" (
  ".venv\Scripts\python.exe" -c "import sys; raise SystemExit(0 if sys.version_info >= (3,11) else 1)" >>"%LOGFILE%" 2>&1
  if errorlevel 1 (
    echo Eski veya bozuk sanal ortam kaldiriliyor...
    rmdir /s /q ".venv" >>"%LOGFILE%" 2>&1
  )
)

if not exist ".venv\Scripts\python.exe" (
  echo Sanal ortam olusturuluyor...
  %PYTHON% -m venv .venv >>"%LOGFILE%" 2>&1
  if errorlevel 1 goto :error
)

echo Gerekli paketler kuruluyor veya guncelleniyor...
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check --upgrade pip >>"%LOGFILE%" 2>&1
if errorlevel 1 goto :error
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -r requirements.txt >>"%LOGFILE%" 2>&1
if errorlevel 1 goto :error

".venv\Scripts\python.exe" -c "from ua_admission import create_app; create_app({'TESTING': True}); print('OK')" >>"%LOGFILE%" 2>&1
if errorlevel 1 goto :error

echo.
echo Uygulama baslatiliyor: http://127.0.0.1:5000
echo Kapatmak icin bu pencereyi kapatin.
echo Baslatma gunlugu: %LOGFILE%
echo.
start "" /b cmd /c "ping 127.0.0.1 -n 3 >nul & start http://127.0.0.1:5000"
".venv\Scripts\python.exe" -m waitress --listen=127.0.0.1:5000 --call ua_admission:create_app >>"%LOGFILE%" 2>&1
if errorlevel 1 goto :error
exit /b 0

:python_missing
echo HATA: Python bulunamadi.
echo Python 3.11 veya yenisini kurun ve "Add Python to PATH" kutusunu isaretleyin.
echo https://www.python.org/downloads/windows/
goto :pause_error

:python_old
echo HATA: Python surumu eski. Python 3.11 veya yenisi gereklidir.
goto :pause_error

:error
echo.
echo KURULUM VEYA CALISTIRMA HATASI
echo Ayrintilar su dosyaya yazildi:
echo %LOGFILE%
echo Dosyanin son satirlarini veya ekran goruntusunu paylasin.

:pause_error
echo.
pause
exit /b 1
