@echo off

IF EXIST HogwartsLegacy.exe IF NOT EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts2
IF EXIST Cyberpunk2077.exe GOTO cleanupCP2077
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
IF EXIST eldenring.exe IF EXIST start_protected_game_ori.exe GOTO cleanupEldenRing
IF EXIST Outlaws.exe GOTO cleanupStarWarsOutlaws
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

:cleanupEldenRing
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"
REN start_protected_game_ori.exe start_protected_game.exe

echo Restoring graphic settings...
SET sub=\EldenRing\
SET "dst=%APPDATA%%sub%"
DEL "%dst%GraphicsConfig.xml"
REN "%dst%GraphicsConfig_ori.xml" GraphicsConfig.xml
GOTO end

:cleanupStarWarsOutlaws
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\My Games\Outlaws\
SET "dst=%USERPROFILE%\Documents%sub%"
DEL "%dst%graphic settings.cfg"
REN "%dst%graphic settings_ori.cfg" "graphic settings.ini"
GOTO end

:end
echo All done ! Please report any issues on my GitHub: Yelodress
pause