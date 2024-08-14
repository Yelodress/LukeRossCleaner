@echo off

IF EXIST HogwartsLegacy.exe IF NOT EXIST EOSSDK-Win64-Shipping.dll GOTO cleaningHogwarts
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleaningHogwarts2
ECHO This game is not supported for now.
GOTO :end

:cleaningHogwarts
echo Deleting mod files...
RMDIR /s /q "Phoenix\Binaries\Win64\RealRepo"
DEL "Phoenix\Binaries\Win64\cudart64_110.dll"
DEL "Phoenix\Binaries\Win64\dxgi.dll"
DEL "Phoenix\Binaries\Win64\openvr_api.dll"
DEL "Phoenix\Binaries\Win64\RealConfig.bat"
DEL "Phoenix\Binaries\Win64\RealVR.ini"
DEL "Phoenix\Binaries\Win64\RealVR64.log"
DEL "Phoenix\Binaries\Win64\RealConfig.bat"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
COPY "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini"
DEL "%dst%GameUserSettings_ori.ini"
GOTO end


:cleaningHogwarts2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealConfig.bat" 

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" 
GOTO end

:end
echo All done ! Please report any issues on my GitHub: Yelodress
pause

:abort
ECHO Aborting LRCleaner.
pause