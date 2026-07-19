@echo off
echo.
echo ===============================================
echo  AUTOBIOGRAPHY TEMPLATE SETUP (Windows)
echo ===============================================
echo.
echo This script will set up your autobiography website.
echo.

REM Check if Ruby is installed
ruby --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Ruby is not installed or not in PATH
    echo.
    echo Please install Ruby first:
    echo 1. Download from: https://rubyinstaller.org/
    echo 2. Install with DevKit
    echo 3. Restart command prompt and try again
    echo.
    pause
    exit /b 1
)

echo ✓ Ruby is installed
echo.

REM Check if we're in the right directory
if not exist "Gemfile" (
    echo ERROR: Gemfile not found
    echo Please run this script from the autobiography_template folder
    echo.
    pause
    exit /b 1
)

echo ✓ Found project files
echo.

REM Run the Ruby setup wizard
echo Starting setup wizard...
echo.
ruby setup_wizard.rb

if %errorlevel% neq 0 (
    echo.
    echo Setup encountered errors. Please check the messages above.
    pause
    exit /b 1
)

echo.
echo ===============================================
echo  SETUP COMPLETE!
echo ===============================================
echo.
echo Your autobiography website is ready!
echo.
echo To start the server:
echo   rails server
echo.
echo Then visit: http://localhost:3000
echo.
pause