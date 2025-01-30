@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`powershell "[Environment]::GetFolderPath('Personal')"`) DO SET doc=%%F\
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell "(new-object -COM Shell.Application).Namespace(0x05).Self.Path"`) DO SET doc1=%%F\
SET "doc2=%USERPROFILE%\Documents\"
IF "%doc1%"=="\" SET "doc1=%doc2%"
IF "%doc%"=="\" SET "doc=%doc1%"

IF EXIST AtomicHeart-Win*-Shipping.exe GOTO cleanupAH
IF EXIST afop.exe GOTO cleanupAFOP
IF EXIST afop_plus.exe GOTO cleanupAFOP
IF EXIST Cyberpunk2077.exe GOTO cleanupCP2077
IF EXIST DarkSoulsRemastered.exe GOTO cleanupDSR
IF EXIST eldenring.exe IF EXIST start_protected_game_ori.exe GOTO cleanupEldenRing
IF EXIST FarCryNewDawn.exe GOTO cleanupFCND
IF EXIST FCPrimal.exe GOTO cleanupFCP
IF EXIST FarCry4.exe GOTO cleanupFC4
IF EXIST FarCry5.exe GOTO cleanupFC5
IF EXIST FarCry6.exe GOTO cleanupFC6
IF EXIST GhostOfTsushima.exe GOTO cleanupGOT
IF EXIST Ghostrunner-Win64-Shipping.exe GOTO cleanupGR
IF EXIST GWT.exe IF EXIST OpenImageDenoise.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST XCurl.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST .egstore GOTO cleanupGWTegs
IF EXIST Maine-Win*-Shipping.exe GOTO cleanupGROUNDED
IF EXIST Oregon-Win*-Shipping.exe GOTO cleanupHOL
IF EXIST HorizonForbiddenWest.exe GOTO cleanupHFW
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts
IF EXIST TheGreatCircle.exe GOTO cleanupIJTGC
IF EXIST Outlaws.exe GOTO cleanupStarWarsOutlaws
IF EXIST Outlaws_Plus.exe GOTO cleanupStarWarsOutlaws
IF EXIST Spider-Man.exe GOTO cleanupSPIDERMAN
IF EXIST MilesMorales.exe GOTO cleanupSPIDERMAN
IF EXIST Stray-Win64-Shipping.exe GOTO cleanupSTRAY
IF EXIST u4.exe IF EXIST tll.exe GOTO cleanupULOTC
IF EXIST watch_dogs.exe GOTO cleanupWD1
IF EXIST WatchDogs2.exe GOTO cleanupWD2
ECHO This game is not supported for now.
GOTO abort

:cleanupAFOP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\AFOP\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

DEL "%dst%graphic settings.cfg" "%dst%persistent_settings.cfg" "%dst%state.cfg"
REN "%dst%graphic settings_ori.cfg" graphic settings.cfg
REN "%dst%persistent_settings_ori.cfg" persistent_settings.cfg
REN "%dst%state_ori.cfg" state.cfg
GOTO end

:cleanupAH
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\AtomicHeart\Saved\Config\WindowsNoEditor\
SET subGDK=\AtomicHeart\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
)
IF EXIST "%dstGDK%" (
    DEL "%dstGDK%GameUserSettings.ini"
    REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
)
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

:cleanupDSR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\FromSoftware\NBGI\DarkSouls\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%DarkSouls.ini"
REN "%dst%DarkSouls_ori.ini" DarkSouls.ini
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

:cleanupFCND
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry New Dawn\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
DEL "%dst%\gamerprofile.xml" 
REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
GOTO end

:cleanupFCP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry Primal\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
DEL "%dst%\gamerprofile.xml" 
REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
GOTO end

:cleanupFC4
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 4\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    IF EXIST "%dst%%%D\GamerProfile_ori.xml" (
        DEL "%dst%%%D\GamerProfile.xml" 
        REN "%dst%%%D\GamerProfile_ori.xml" GamerProfile.xml
    )
)
GOTO end

:cleanupFC5
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 5\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
DEL "%dst%\gamerprofile.xml" 
REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
GOTO end

:cleanupFC6
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 6\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
DEL "%dst%\gamerprofile.xml" 
REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
GOTO end

:cleanupGOT
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Sucker Punch Productions\Ghost of Tsushima DIRECTOR'S CUT\Graphics"
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

:cleanupGROUNDED
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Maine\Saved\Config\WindowsNoEditor\
SET subGDK=\Maine\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
)
IF EXIST "%dstGDK%" (
    DEL "%dstGDK%GameUserSettings.ini"
    REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
)
GOTO end

:cleanupHOL
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Oregon\Saved\Config\WindowsNoEditor\
SET subGDK=\Oregon\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
)
IF EXIST "%dstGDK%" (
    DEL "%dstGDK%GameUserSettings.ini"
    REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
)
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
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupIJTGC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.json" "RealVR64.dll"

echo Restoring graphic settings...
powershell -Command "& { $path = 'HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers'; $regName = (Get-ItemProperty -Path $path | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -like '*RealVR64.json' }).Name; if ($regName) { Start-Process cmd -ArgumentList ('/c REG DELETE \"HKLM\SOFTWARE\Khronos\Vulkan\ImplicitLayers\" /V \"' + $regName + '\" /F') -Verb RunAs } }"
GOTO end

:cleanupStarWarsOutlaws
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Documents\My Games\Outlaws\
SET "dst=%USERPROFILE%%sub%"
DEL "%dst%graphic settings.cfg"
REN "%dst%graphic settings_ori.cfg" "graphic settings.cfg"
GOTO end

:cleanupSPIDERMAN
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"
GOTO end

:cleanupSTRAY
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Hk_project\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
DEL "%dst%GameUserSettings.ini"
REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
GOTO end

:cleanupULOTC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=Uncharted4_data\
DEL "%sub%screeninfo.cfg"
REN "%sub%screeninfo_ori.cfg" screeninfo.cfg
GOTO end

:cleanupWD1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Documents\My Games\Watch_Dogs\
SET "dst=%USERPROFILE%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    DEL "%dst%%%D\GamerProfile.xml"
    REN "%dst%%%D\GamerProfile_ori.xml" GamerProfile.xml
)
GOTO end

:cleanupWD2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_110.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch_Dogs 2\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
DEL "%dst%\WD2_GamerProfile.xml"
REN "%dst%\WD2_GamerProfile_ori.xml" WD2_GamerProfile.xml
GOTO end

:abort
echo Execution aborted. Please report any issues on my GitHub: Yelodress
pause

:end
echo All done ! Please report any issues on my GitHub: Yelodress
echo This script will remove itself after pressing any key
pause
DEL "LRCleaner.bat"