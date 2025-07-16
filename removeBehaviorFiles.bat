@echo off
setlocal enabledelayedexpansion

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH2=..\OSex\meshes\actors\character\behaviors"
if exist "%DEL_PATH2%" (
    echo Found folder to delete: "%DEL_PATH2%"
    rmdir /s /q "%DEL_PATH2%"
    echo Deleted folder: "%DEL_PATH2%"
) else (
    echo Folder not found: "%DEL_PATH2%" (nothing to delete)
)
echo.

REM --- DELETE FOLDER IF EXISTS ---
set "DEL_PATH=..\OSexPack Dual Wield\meshes\actors\character\behaviors"
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
