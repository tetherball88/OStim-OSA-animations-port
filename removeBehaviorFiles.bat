@echo off
setlocal enabledelayedexpansion


REM --- SET ROOT PATH VARIABLE ---
set "ROOT=.."

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSex\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSexPack Dual Wield\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSexPack Bad Girls of Skyrim\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSexPack Bad Boys of Skyrim\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSexPack Wizard Sex\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=%ROOT%\OSexAttire AE\meshes\actors\character\behaviors"
if exist "%DEL_PATH%" (
    echo Found folder to delete: "%DEL_PATH%"
    rmdir /s /q "%DEL_PATH%"
    echo Deleted folder: "%DEL_PATH%"
) else (
    echo Folder not found: "%DEL_PATH%" (nothing to delete)
)
echo.


echo Done.
pause
