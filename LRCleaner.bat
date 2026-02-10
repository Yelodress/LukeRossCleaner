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
IF EXIST DarkSoulsII.exe GOTO cleanupDS2
IF EXIST DarkSoulsIII.exe GOTO cleanupDS3
IF EXIST DOOMEternalx64vk.exe GOTO cleanupDOOME
IF EXIST eldenring.exe GOTO cleanupEldenRing
IF EXIST FarCryNewDawn.exe GOTO cleanupFCND
IF EXIST FCPrimal.exe GOTO cleanupFCP
IF EXIST FarCry4.exe GOTO cleanupFC4
IF EXIST FarCry5.exe GOTO cleanupFC5
IF EXIST FarCry6.exe GOTO cleanupFC6
IF EXIST ff7rebirth_.exe GOTO cleanupFF7RB
IF EXIST ff7remake_.exe GOTO cleanupFF7R
IF EXIST GhostOfTsushima.exe GOTO cleanupGOT
IF EXIST Ghostrunner-Win64-Shipping.exe GOTO cleanupGR
IF EXIST GWT.exe IF EXIST OpenImageDenoise.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST XCurl.dll GOTO cleanupGWT
IF EXIST GWT.exe IF EXIST .egstore GOTO cleanupGWTegs
IF EXIST GTA5.exe GOTO cleanupGTA5
IF EXIST Maine-Win*-Shipping.exe GOTO cleanupGROUNDED
IF EXIST Oregon-Win*-Shipping.exe GOTO cleanupHOL
IF EXIST HorizonForbiddenWest.exe GOTO cleanupHFW
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
IF EXIST HogwartsLegacy.exe IF EXIST EOSSDK-Win64-Shipping.dll GOTO cleanupHogwarts
IF EXIST KingdomCome.exe GOTO cleanupKCD2
IF EXIST TheGreatCircle.exe GOTO cleanupIJTGC
IF EXIST mafiadefinitiveedition.exe GOTO cleanupMDE1
IF EXIST "Mafia II Definitive Edition.exe" GOTO cleanupMDE2
IF EXIST mafia3definitiveedition.exe GOTO cleanupMDE3
IF EXIST Outlaws.exe GOTO cleanupStarWarsOutlaws
IF EXIST Outlaws_Plus.exe GOTO cleanupStarWarsOutlaws
IF EXIST RDR2.exe GOTO cleanupRDR2
IF EXIST Spider-Man.exe GOTO cleanupSPIDERMAN
IF EXIST MilesMorales.exe GOTO cleanupSPIDERMAN
IF EXIST Stray-Win64-Shipping.exe GOTO cleanupSTRAY
IF EXIST tlou-i.exe GOTO cleanupTLOU1
IF EXIST tlou-ii.exe GOTO cleanupTLOU2
IF EXIST u4.exe IF EXIST tll.exe GOTO cleanupULOTC
IF EXIST watch_dogs.exe GOTO cleanupWD1
IF EXIST WatchDogs2.exe GOTO cleanupWD2
IF EXIST WatchDogsLegion.exe GOTO cleanupWDL
ECHO This game is not supported for now.
GOTO abort

:cleanupAFOP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\AFOP\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

IF ExIST "%dst%graphic settings_ori.cfg" (
    DEL "%dst%graphic settings.cfg" "%dst%persistent_settings.cfg" "%dst%state.cfg"
    REN "%dst%graphic settings_ori.cfg" graphic settings.cfg
    REN "%dst%persistent_settings_ori.cfg" persistent_settings.cfg
    REN "%dst%state_ori.cfg" state.cfg
) ELSE GOTO no_ori

GOTO end

:cleanupAH
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\AtomicHeart\Saved\Config\WindowsNoEditor\
SET subGDK=\AtomicHeart\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    IF ExIST "%dst%GameUserSettings_ori.ini" (
        DEL "%dst%GameUserSettings.ini"
        REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
IF EXIST "%dstGDK%" (
    IF ExIST "%dst%GraphicsConfig_ori.xml" (
        DEL "%dstGDK%GameUserSettings.ini"
        REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
GOTO end

:cleanupCP2077
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\CD Projekt Red\Cyberpunk 2077\
SET "dst=%LOCALAPPDATA%%sub%"
IF EXIST "%dst%UserSettings_ori.json" (
    DEL "%dst%UserSettings.json"
    REN "%dst%UserSettings_ori.json" UserSettings.json
)
GOTO end

:cleanupDSR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\FromSoftware\NBGI\DarkSouls\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%DarkSouls_ori.ini" (
    DEL "%dst%DarkSouls.ini"
    REN "%dst%DarkSouls_ori.ini" DarkSouls.ini
) ELSE GOTO no_ori
GOTO end

:cleanupDS2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=\DarkSoulsII\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_SOFS_ori.xml" (
    DEL "%dst%GraphicsConfig_SOFS.xml"
    REN "%dst%GraphicsConfig_SOFS_ori.xml" GraphicsConfig_SOFS.xml
) ELSE GOTO no_ori
GOTO end

:cleanupDS3
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=\DarkSoulsIII\
SET "dst=%APPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_ori.xml" (
    DEL "%dst%GraphicsConfig.xml"
    REN "%dst%GraphicsConfig_ori.xml" GraphicsConfig.xml
) ELSE GOTO no_ori
GOTO end

:cleanupDOOME
echo Deleting mod files...
RMDIR /s /q "doomSandBox\RealRepo" "RealRepo"
DEL doomSandBox\cudart64_*.dll "doomSandBox\openvr_api.dll" "doomSandBox\RealVR.ini" cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
powershell -Command "& { $path = 'HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers'; $regName = (Get-ItemProperty -Path $path | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -like '*RealVR64.json' }).Name; if ($regName) { Start-Process cmd -ArgumentList ('/c REG DELETE \"HKLM\SOFTWARE\Khronos\Vulkan\ImplicitLayers\" /V \"' + $regName + '\" /F') -Verb RunAs } }"
GOTO end

:cleanupEldenRing
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\EldenRing\
SET "dst=%APPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_ori.xml" (
    DEL "%dst%GraphicsConfig.xml"
    REN "%dst%GraphicsConfig_ori.xml" GraphicsConfig.xml
) ELSE GOTO no_ori
GOTO end

:cleanupFCND
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry New Dawn\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    DEL "%dst%\gamerprofile.xml" 
    REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
) ELSE GOTO no_ori
GOTO end

:cleanupFCP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry Primal\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    DEL "%dst%\gamerprofile.xml" 
    REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
) ELSE GOTO no_ori
GOTO end

:cleanupFC4
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

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
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 5\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    DEL "%dst%\gamerprofile.xml" 
    REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
) ELSE GOTO no_ori
GOTO end

:cleanupFC6
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 6\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    DEL "%dst%\gamerprofile.xml" 
    REN "%dst%\gamerprofile_ori.xml" gamerprofile.xml
) ELSE GOTO no_ori
GOTO end

:cleanupFF7R
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\FINAL FANTASY VII REMAKE\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%EOS"') DO (
    DEL "%dst%EOS\%%D\ff7remakedevice.sav"
)
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%Steam"') DO (
    DEL "%dst%Steam\%%D\ff7remakedevice.sav"
)

SET "sub2=%dst%Saved\Config\WindowsNoEditor\"
IF ExIST "%sub2%Engine_ori.ini" (
    DEL "%sub2%Engine.ini" 
    REN "%sub2%Engine_ori.ini" Engine.ini
) ELSE GOTO no_ori
GOTO end

:cleanupFF7RB
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\FINAL FANTASY VII REBIRTH\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%EOS"') DO (
    DEL "%dst%EOS\%%D\ff7rebirthdevice.sav"
)
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%Steam"') DO (
    DEL "%dst%Steam\%%D\ff7rebirthdevice.sav"
)
GOTO end

:cleanupGOT
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Sucker Punch Productions\Ghost of Tsushima DIRECTOR'S CUT\Graphics"
GOTO end

:cleanupGR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Ghostrunner\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini  
) ELSE GOTO no_ori
GOTO end

:cleanupGWT
echo Deleting mod files...
RMDIR /s /q "RealRepo" "reshade-shaders"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "ReShadePreset.ini"

echo Restoring graphic settings...
SET "sub=\Saved Games\TangoGameworks\Saved\Config\WindowsNoEditor\"
SET "dst=%USERPROFILE%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
) ELSE GOTO no_ori
GOTO end

:cleanupGWTegs
echo Deleting mod files...
RMDIR /s /q "RealRepo" "reshade-shaders"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "ReShadePreset.ini"

echo Restoring graphic settings...
SET "sub=\Saved Games\TangoGameworks\GhostWire Tokyo (EGS)\Saved\Config\WindowsNoEditor\"
SET "dst=%USERPROFILE%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
) ELSE GOTO no_ori
GOTO end

:cleanupGTA5
echo Deleting mod files...
RMDIR /s /q "asi" "Settings" "ShaderFixes"
DEL "RealVR.ini" "d3d11.dll" "ScriptHookV.dll" "RealConfig.bat" "commandline.txt" "openvr_api.dll" "nvapi64.dll" "d3dx.ini" "dinput8.dll" "ScriptHookV.log" "asiloader.log" "args.txt" "NativeTrainer.asi"

echo Restoring graphic settings...
SET "sub=\Rockstar Games\GTA V\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%settings_ori.xml" (
    DEL "%dst%settings.xml"
    REN "%dst%settings_ori.xml" settings.xml
) ELSE GOTO no_ori
GOTO end

:cleanupGROUNDED
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Maine\Saved\Config\WindowsNoEditor\
SET subGDK=\Maine\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    IF ExIST "%dst%GameUserSettings_ori.ini" (
        DEL "%dst%GameUserSettings.ini"
        REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
IF EXIST "%dstGDK%" (
    IF ExIST "%dstGDK%GameUserSettings_ori.ini" (
        DEL "%dstGDK%GameUserSettings.ini"
        REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
GOTO end

:cleanupHOL
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Oregon\Saved\Config\WindowsNoEditor\
SET subGDK=\Oregon\Saved\Config\WinGDK\
SET "dst=%LOCALAPPDATA%%sub%"
SET "dstGDK=%LOCALAPPDATA%%subGDK%"
IF EXIST "%dst%" (
    IF ExIST "%dst%GameUserSettings_ori.ini" (
        DEL "%dst%GameUserSettings.ini"
        REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
IF EXIST "%dstGDK%" (
    IF ExIST "%dstGDK%GameUserSettings_ori.ini" (
        DEL "%dstGDK%GameUserSettings.ini"
        REN "%dstGDK%GameUserSettings_ori.ini" GameUserSettings.ini
    ) ELSE GOTO no_ori
)
GOTO end

:cleanupHFW
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Guerrilla Games\Horizon Forbidden West Complete Edition\Graphics"
GOTO end

:cleanupHZD
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Horizon Zero Dawn\Saved Game\profile\
SET "dst=%USERPROFILE%\Documents%sub%"
IF ExIST "%dst%graphicsconfig_ori.ini" (
    DEL "%dst%graphicsconfig.ini"
    REN "%dst%graphicsconfig_ori.ini" graphicsconfig.ini
) ELSE GOTO no_ori
GOTO end

:cleanupHogwarts
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
) ELSE GOTO no_ori
GOTO end

:cleanupKCD2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Saved Games\kingdomcome2\profiles\default\
SET "dst=%USERPROFILE%%sub%"
IF ExIST "%dst%attributes_ori.xml" (
    DEL "%dst%attributes.xml"
    REN "%dst%attributes_ori.xml" attributes.xml
    DEL "..\..\user.cfg"
    REN "..\..\user_ori.cfg" user.cfg
) ELSE GOTO no_ori

GOTO end

:cleanupIJTGC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.json" "RealVR64.dll"

echo Restoring graphic settings...
powershell -Command "& { $path = 'HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers'; $regName = (Get-ItemProperty -Path $path | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -like '*RealVR64.json' }).Name; if ($regName) { Start-Process cmd -ArgumentList ('/c REG DELETE \"HKLM\SOFTWARE\Khronos\Vulkan\ImplicitLayers\" /V \"' + $regName + '\" /F') -Verb RunAs } }"
GOTO end

:cleanupMDE1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Mafia Definitive Edition\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%Data"') DO (
    DEL "%dst%Data\%%D\profiles\temporaryprofile\profile_videosettings.pf"
)
DEL "%dst%Saves\videoconfig.cfg"
DEL "%dst%Saves\launcconfig.cfg"
GOTO end

:cleanupMDE2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Mafia II Definitive Edition\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%Data\profiles"') DO (
    DEL "%dst%Data\profiles\%%D\settings.xml"
)
GOTO end

:cleanupMDE3
echo Deleting mod files...
RMDIR /s /q "RealRepo" "reshade-shaders"
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll" "ReShadePreset.ini"

echo Restoring graphic settings...
SET "sub=\2K Games\Mafia III\"
SET "dst=%LOCALAPPDATA%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%Data"') DO (
    DEL "%dst%Data\%%D\profiles\temporaryprofile\profile_videosettings.pf"
)
DEL "%dst%Saves\videoconfig.cfg"
DEL "%dst%Saves\launcconfig.cfg"
GOTO end

:cleanupStarWarsOutlaws
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll" 

echo Restoring graphic settings...
SET sub=\Documents\My Games\Outlaws\
SET "dst=%USERPROFILE%%sub%"
IF ExIST "%dst%graphic settings_ori.cfg" (
    DEL "%dst%graphic settings.cfg"
    REN "%dst%graphic settings_ori.cfg" "graphic settings.cfg"
) ELSE GOTO no_ori
GOTO end

:cleanupRDR2
echo Deleting mod files...
RMDIR /s /q "RealRepo" "Settings"
DEL "RealVR_RDR2.asi" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "ScriptHookRDR2.dll" "RealVR64.dll" "dinput8.dll" "commandline.txt" "RealVR64.json"

echo Restoring graphic settings...
powershell -Command "& { $path = 'HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers'; $regName = (Get-ItemProperty -Path $path | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -like '*RealVR64.json' }).Name; if ($regName) { Start-Process cmd -ArgumentList ('/c REG DELETE \"HKLM\SOFTWARE\Khronos\Vulkan\ImplicitLayers\" /V \"' + $regName + '\" /F') -Verb RunAs } }"
SET "sub=Rockstar Games\Red Dead Redemption 2\Settings\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%system_ori.xml" (
    DEL "%dst%system.xml"
    REN "%dst%system_ori.xml" system.xml
) ELSE GOTO no_ori
GOTO end

:cleanupSPIDERMAN
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "RealVR64.dll"
GOTO end

:cleanupSTRAY
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Hk_project\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    DEL "%dst%GameUserSettings.ini"
    REN "%dst%GameUserSettings_ori.ini" GameUserSettings.ini
) ELSE GOTO no_ori
GOTO end

:cleanupTLOU1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Saved Games\The Last of Us Part I\users\
SET "dst=%USERPROFILE%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    IF ExIST "%dst%%%D\screeninfo_ori.cfg" (
        DEL "%dst%%%D\screeninfo.cfg"
        REN "%dst%%%D\screeninfo_ori.cfg" screeninfo.cfg
    ) ELSE GOTO no_ori
)
GOTO end

:cleanupTLOU2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Naughty Dog\The Last of Us Part II\Graphics"
REG delete "HKCU\Software\Naughty Dog\The Last of Us Part II\UI"

GOTO end

:cleanupULOTC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log" "start_protected_game.exe" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=Uncharted4_data\
IF ExIST "%sub%screeninfo_ori.cfg" (
    DEL "%sub%screeninfo.cfg"
    REN "%sub%screeninfo_ori.cfg" screeninfo.cfg
) ELSE GOTO no_ori
GOTO end

:cleanupWD1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Documents\My Games\Watch_Dogs\
SET "dst=%USERPROFILE%%sub%"
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    IF ExIST "%dst%%%D\GamerProfile_ori.xml" (
        DEL "%dst%%%D\GamerProfile.xml"
        REN "%dst%%%D\GamerProfile_ori.xml" GamerProfile.xml
    ) ELSE GOTO no_ori
)
GOTO end

:cleanupWD2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch_Dogs 2\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\WD2_GamerProfile_ori.xml" (
    DEL "%dst%\WD2_GamerProfile.xml"
    REN "%dst%\WD2_GamerProfile_ori.xml" WD2_GamerProfile.xml
) ELSE GOTO no_ori
GOTO end

:cleanupWDL
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL cudart64_*.dll "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch Dogs Legion\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%"') DO (
    IF EXIST "%dst%%%D\WD3_GamerProfile_ori.xml" (
        DEL "%dst%%%D\WD3_GamerProfile.xml"
        REN "%dst%%%D\WD3_GamerProfile_ori.xml" "WD3_GamerProfile.xml"
    ) ELSE GOTO no_ori
)

GOTO end

:no_ori
echo It seems that there are no graphic presets created by the R.E.A.L. mod. Skipping graphic settings restoration...

:abort
echo Execution aborted. Please report any issues on my GitHub: Yelodress
pause

:end
echo All done, time to re-enjoy your game !
echo This script will remove itself after pressing any key
pause
DEL "LRCleaner.bat"