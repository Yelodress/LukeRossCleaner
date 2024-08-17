@echo off

IF EXIST HogwartsLegacy.exe IF NOT EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts2
IF EXIST Cyberpunk2077.exe GOTO cleanupCP2077
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
ECHO This game is not supported for now.
GOTO :end

:cleanupHogwarts
echo Deleting mod files...
RMDIR /s /q "Phoenix\Binaries\Win64\RealRepo"
DEL "Phoenix\Binaries\Win64\cudart64_110.dll"
DEL "Phoenix\Binaries\Win64\dxgi.dll"
DEL "Phoenix\Binaries\Win64\openvr_api.dll"
DEL "Phoenix\Binaries\Win64\RealConfig.bat"
DEL "Phoenix\Binaries\Win64\RealVR.ini"
DEL "Phoenix\Binaries\Win64\RealVR64.log"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end


:cleanupHogwarts2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupCP2077
echo Deleting mod files...
RMDIR /s /q "Phoenix\Binaries\Win64\RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\CD Projekt Red\Cyberpunk 2077\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%UserSettings.json"
REN "%dst%UserSettings_ori.json" UserSettings.json
GOTO end

:cleanupHZD
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Horizon Zero Dawn\Saved Game\profile\

SET "dst=%USERPROFILE%\Documents%sub%"
DEL "%dst%graphicsconfig.ini"
REN "%dst%graphicsconfig_ori.ini" graphicsconfig.ini
GOTO end

:end
echo All done ! Please report any issues on my GitHub: Yelodress
pause