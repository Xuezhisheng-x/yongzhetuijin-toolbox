@echo off
setlocal

set "GIT=C:\Users\40270\.workbuddy\binaries\PortableGit\versions\1.2.0\mingw64\bin\git.exe"

cd /d "%~dp0"

if not exist "%GIT%" (
  echo ERROR: git not found at %GIT%
  pause
  exit /b 1
)

echo === Step 1: Set remote ===
"%GIT%" remote remove origin 2>nul
"%GIT%" remote add origin https://github.com/Xuezhisheng-x/yongzhetuijin-toolbox.git
"%GIT%" branch -M main

echo.
echo === Step 2: Commit changes ===
"%GIT%" add -A
"%GIT%" -c user.email="you@example.com" -c user.name="Xuezhisheng-x" commit -q -m "update" 2>nul

echo.
echo === Step 3: Push to GitHub ===
echo If browser pops up, login with Xuezhisheng-x account.
echo.
"%GIT%" push -u origin main

if %errorlevel%==0 (
  echo.
  echo === PUSH OK ===
  echo Next: open GitHub repo Settings -> Pages ->
  echo Source=Deploy from branch -> Branch=main -> Save
  echo URL: https://xuezhisheng-x.github.io/yongzhetuijin-toolbox/
) else (
  echo.
  echo PUSH FAILED.
  echo Make sure you created the repo first on GitHub.
)
pause
