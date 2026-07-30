@echo off
setlocal EnableExtensions
chcp 65001 >nul
title UA Admission Intelligence - GitHub Yukleyici
color 0F

cd /d "%~dp0"

echo ============================================================
echo UA-Admission-Intelligence GitHub Yukleyici
echo ============================================================
echo.
echo Calisma klasoru:
echo %CD%
echo.

if not exist "app.py" (
    echo HATA: Bu klasorde app.py bulunamadi.
    echo.
    echo Yapmaniz gereken:
    echo 1. Proje ZIP dosyasini klasore cikarin.
    echo 2. Bu dosyayi app.py dosyasinin yanina koyun.
    echo 3. Tekrar cift tiklayin.
    echo.
    pause
    exit /b 1
)

where git >nul 2>&1
if errorlevel 1 (
    echo HATA: Git for Windows kurulu degil veya PATH'e eklenmemis.
    echo.
    echo Git'i buradan kurun:
    echo https://git-scm.com/download/win
    echo.
    echo Kurulumdan sonra bilgisayari yeniden baslatin ve tekrar deneyin.
    echo.
    pause
    exit /b 1
)

echo Git bulundu:
git --version
echo.

if not exist ".git" (
    echo Git deposu olusturuluyor...
    git init
    if errorlevel 1 goto ERROR
)

for /f "delims=" %%A in ('git config --get user.name 2^>nul') do set "GITNAME=%%A"
if not defined GITNAME (
    set /p "GITNAME=GitHub kullanici adinizi yazin: "
    if not defined GITNAME goto CANCEL
    git config user.name "%GITNAME%"
    if errorlevel 1 goto ERROR
)

for /f "delims=" %%A in ('git config --get user.email 2^>nul') do set "GITEMAIL=%%A"
if not defined GITEMAIL (
    set /p "GITEMAIL=GitHub e-posta adresinizi yazin: "
    if not defined GITEMAIL goto CANCEL
    git config user.email "%GITEMAIL%"
    if errorlevel 1 goto ERROR
)

echo.
echo Dosyalar hazirlaniyor...
git add .
if errorlevel 1 goto ERROR

git diff --cached --quiet
if errorlevel 1 (
    echo Commit olusturuluyor...
    git commit -m "Initial release"
    if errorlevel 1 goto ERROR
) else (
    echo Yeni commit gerektiren degisiklik bulunmadi.
)

git branch -M main
if errorlevel 1 goto ERROR

git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin https://github.com/sszul/UA-Admission-Intelligence.git
) else (
    git remote set-url origin https://github.com/sszul/UA-Admission-Intelligence.git
)
if errorlevel 1 goto ERROR

echo.
echo GitHub'a yukleme basliyor...
echo Giris penceresi acilirsa GitHub hesabinizla giris yapin.
echo.
git push -u origin main
if errorlevel 1 goto PUSH_ERROR

echo.
echo ============================================================
echo BASARILI
echo Proje GitHub'a yuklendi:
echo https://github.com/sszul/UA-Admission-Intelligence
echo ============================================================
echo.
pause
exit /b 0

:PUSH_ERROR
echo.
echo ============================================================
echo GITHUB YUKLEME HATASI
echo ============================================================
echo.
echo Yukaridaki hata metninin ekran goruntusunu gonderin.
echo.
pause
exit /b 1

:ERROR
echo.
echo ============================================================
echo ISLEM HATASI
echo ============================================================
echo.
echo Yukaridaki hata metninin ekran goruntusunu gonderin.
echo.
pause
exit /b 1

:CANCEL
echo.
echo Islem iptal edildi.
echo.
pause
exit /b 1
