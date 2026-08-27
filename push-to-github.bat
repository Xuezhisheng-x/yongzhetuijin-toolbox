@echo off
setlocal

set "GIT=C:\Users\40270\.workbuddy\binaries\PortableGit\versions\1.2.0\mingw64\bin\git.exe"
set "LOG=%~dp0push.log"

cd /d "%~dp0"

echo [%date% %time%] START > "%LOG%"

if not exist "%GIT%" (
  echo [%date% %time%] ERROR: git not found >> "%LOG%"
  echo git not found at %GIT%
  goto :end
)

echo [%date% %time%] Step1: set remote >> "%LOG%"
"%GIT%" remote remove origin >> "%LOG%" 2>&1
"%GIT%" remote add origin https://github.com/Xuezhisheng-x/yongzhetuijin-toolbox.git >> "%LOG%" 2>&1
"%GIT%" branch -M main >> "%LOG%" 2>&1

echo [%date% %time%] Step2: commit >> "%LOG%"
"%GIT%" add -A >> "%LOG%" 2>&1
"%GIT%" -c user.email="you@example.com" -c user.name="Xuezhisheng-x" commit -q -m "update" >> "%LOG%" 2>&1

echo [%date% %time%] Step3: push >> "%LOG%"
echo If browser pops up, login with Xuezhisheng-x account. >> "%LOG%"
"%GIT%" push -u origin main >> "%LOG%" 2>&1
set "RC=%errorlevel%"
echo [%date% %time%] push exit code: %RC% >> "%LOG%"

if %RC%==0 (
  echo.
  echo === PUSH OK ===
  echo Next: GitHub repo Settings -^> Pages -^> Source=Deploy from branch -^> Branch=main -^> Save
  echo URL: https://xuezhisheng-x.github.io/yongzhetuijin-toolbox/
) else (
  echo.
  echo PUSH FAILED. See push.log for details.
  echo Make sure repo was created on GitHub first.
)

:end
echo [%date% %time%] END >> "%LOG%"
pause
