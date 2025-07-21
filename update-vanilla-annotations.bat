@echo off
setlocal enabledelayedexpansion

REM =====================
REM Prompt user for paths
REM =====================
echo.
echo === Skyrim HKX Annotation Updater ===
echo.

set "ERROR_LOG=%~dp0errors.log"
del "%ERROR_LOG%" >nul 2>&1

set "HKANNO_EXE=E:\Skyrim\Tools\hkanno64-001\hkanno64.exe"
set /p HKANNO_EXE=Enter full path to hkanno64.exe [Default: !HKANNO_EXE!]: 
if "!HKANNO_EXE!"=="" set "HKANNO_EXE=E:\Skyrim\Tools\hkanno64-001\hkanno64.exe"

REM Prompt for main donor folder, then append static subpath
set "DONOR_MAIN_DIR=..\OSex"
set /p DONOR_MAIN_DIR=Enter path to OSA Vanilla OSex animation pack main folder [Default: !DONOR_MAIN_DIR!]: 
if "!DONOR_MAIN_DIR!"=="" set "DONOR_MAIN_DIR=..\OSex"
set "DONOR_ANIM_DIR=!DONOR_MAIN_DIR!\meshes\0SA\mod\0Sex\anim\vanilla"

REM Automatically set SOURCE_ANIM_DIR to be in the same folder as this bat, with last folder name from donor dir
for %%F in ("%DONOR_ANIM_DIR%") do set "_DONOR_LAST=%%~nxF"
set "SOURCE_ANIM_DIR=%~dp0meshes\0SA\mod\0Sex\anim\%_DONOR_LAST%"
echo Source animation directory automatically set to: %SOURCE_ANIM_DIR%

REM Set path to annotations-vanilla.json in the same folder as this script
set "ANNOTATION_JSON=%~dp0annotations-vanilla.json"

REM Set TMP_TXT to be in the same folder as hkanno64.exe
for %%F in ("%HKANNO_EXE%") do set "TMP_TXT=%%~dpFtmp.txt"

echo.
echo Donor anim folder %DONOR_ANIM_DIR%
echo Target anim folder: %SOURCE_ANIM_DIR%
echo Using annotation JSON: %ANNOTATION_JSON%
echo Temporary annotation file: %TMP_TXT%
echo.

REM =====================
REM Iterate over all animation keys in JSON
REM =====================
REM Iterate over all animation keys in JSON
for /f "delims=" %%A in ('powershell -NoProfile -Command ^
  "Get-Content -LiteralPath \"%ANNOTATION_JSON%\" | ConvertFrom-Json | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name"') do call :process "%%A"
goto :done

:process
set "HKX_FILE=%~1"
set "SOURCE_HKX=%SOURCE_ANIM_DIR%\%HKX_FILE%"
set "DONOR_HKX=%DONOR_ANIM_DIR%\%HKX_FILE%"

echo ----------------------------------------
echo Processing: %HKX_FILE%
echo Checking for file in source: %SOURCE_HKX%

if exist "%SOURCE_HKX%" (
    echo Found in source directory.
    set "TARGET_HKX=%SOURCE_HKX%"
) else if exist "%DONOR_HKX%" (
    echo Not found in source. Checking donor: %DONOR_HKX%

    REM Ensure destination folder exists
    for %%F in ("%SOURCE_HKX%") do (
        if not exist "%%~dpF" (
            echo Creating target directory: %%~dpF
            mkdir "%%~dpF"
        )
    )

    copy /Y "%DONOR_HKX%" "%SOURCE_HKX%" >nul
    echo Copied %HKX_FILE% from donor to source.
    set "TARGET_HKX=%SOURCE_HKX%"
) else (
    echo ERROR: %HKX_FILE% not found in source or donor.
    echo ERROR: %HKX_FILE% not found in source or donor. >> "%ERROR_LOG%"
    goto :eof
)

REM Write annotation lines to temp file
echo Writing annotation lines to temp file...
powershell -NoProfile -Command ^
    "try { $json=Get-Content -LiteralPath '%ANNOTATION_JSON%' | ConvertFrom-Json; $lines=$json.'%HKX_FILE%'; [IO.File]::WriteAllLines('%TMP_TXT%', $lines) } catch { Write-Host 'ERROR writing annotation file'; exit 1 }"
if errorlevel 1 (
    echo ERROR: PowerShell failed to write annotation file for %HKX_FILE% >> "%ERROR_LOG%"
    goto :eof
)
echo PowerShell call finished.

REM Output contents of temp file
echo Contents of %TMP_TXT%:
type "%TMP_TXT%"

REM Update HKX file
echo Running hkanno tool to update annotations...
@REM pushd "%~dp0"
for %%F in ("%HKANNO_EXE%") do set "HKANNO_DIR=%%~dpF"
pushd "%HKANNO_DIR%"
"%HKANNO_EXE%" update -i "%TMP_TXT%" "%TARGET_HKX%"
if errorlevel 1 (
    echo ERROR: hkanno tool failed for %TARGET_HKX% >> "%ERROR_LOG%"
    echo ERROR: hkanno tool failed for %TARGET_HKX%
) else (
    echo Successfully updated: %TARGET_HKX%
)
popd

REM Clean up
del "%TMP_TXT%" >nul 2>&1

goto :eof

:done

echo.
echo All done.
echo.

if exist "%ERROR_LOG%" (
    echo.
    echo === ERRORS WERE LOGGED ===
    echo See error log at: %ERROR_LOG%
) else (
    echo.
    echo No errors encountered.
)

pause
endlocal