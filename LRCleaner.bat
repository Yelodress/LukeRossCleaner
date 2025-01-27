@echo off

IF EXIST Cyberpunk2077.exe GOTO cleanupCP2077
IF EXIST eldenring.exe IF EXIST start_protected_game_ori.exe GOTO cleanupEldenRing
IF EXIST FarCry4.exe GOTO cleanupFC4
IF EXIST FarCry6.exe GOTO cleanupFC6
IF EXIST Ghostrunner-Win64-Shipping.exe GOTO cleanupGR
IF EXIST GWT.exe IF EXIST OpenImageDenoise.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST XCurl.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST .egstore GOTO cleanupGWTegs
IF EXIST HorizonForbiddenWest.exe GOTO cleanupHFW
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
IF EXIST HogwartsLegacy.exe IF NOT EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts2
IF EXIST Outlaws.exe GOTO cleanupStarWarsOutlaws
IF EXIST Outlaws_Plus.exe GOTO cleanupStarWarsOutlaws
ECHO This game is not supported for now.
GOTO abort

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

:cleanupFC4
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub= Documents\My Games\Far Cry 4\
SET dst="%USERPROFILE%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    IF EXIST "%dst%%%D\GamerProfile_ori.xml" (
        DEL "%dst%%%D\GamerProfile.xml" 
        REN "%dst%%%D\GamerProfile_ori.xml" GamerProfile.xml
    )
)
GOTO end

:cleanupFC6
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Documents\My Games\Far Cry 6\
SET dst="%USERPROFILE%%sub%"

IF EXIST "%dst%\gamerprofile_ori.xml" (
    DEL "%dst%\gamerprofile.xml" 
    REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
)

GOTO end

:cleanupGR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Ghostrunner\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupGWT
echo Deleting mod files...
RMDIR /s /q "RealRepo" "reshade-shaders"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "ReShadePreset.ini"

echo Restoring graphic settings...
SET "sub=\Saved Games\TangoGameworks\Saved\Config\WindowsNoEditor\"
SET "dst=%USERPROFILE%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupGWTegs
echo Deleting mod files...
RMDIR /s /q "RealRepo" "reshade-shaders"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "ReShadePreset.ini"

echo Restoring graphic settings...
SET "sub=\Saved Games\TangoGameworks\GhostWire Tokyo (EGS)\Saved\Config\WindowsNoEditor\"
SET "dst=%USERPROFILE%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupHFW
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Guerrilla Games\Horizon Forbidden West Complete Edition\Graphics"
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

:cleanupStarWarsOutlaws
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\My Games\Outlaws\
SET "dst=%USERPROFILE%\Documents%sub%"
DEL "%dst%graphic settings.cfg"
REN "%dst%graphic settings_ori.cfg" "graphic settings.cfg"
GOTO end

:abort
echo Execution aborted. Please report any issues on my GitHub: Yelodress
pause

:end
echo All done ! Please report any issues on my GitHub: Yelodress
echo This script will remove itself after pressing any key
pause
DEL "LRCleaner.bat"