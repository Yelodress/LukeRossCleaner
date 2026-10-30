@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`powershell "[Environment]::GetFolderPath('Personal')"`) DO SET doc=%%F\
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell "(new-object -COM Shell.Application).Namespace(0x05).Self.Path"`) DO SET doc1=%%F\
SET "doc2=%USERPROFILE%\Documents\"
IF "%doc1%"=="\" SET "doc1=%doc2%"
IF "%doc%"=="\" SET "doc=%doc1%"

IF EXIST 007FirstLight.exe GOTO cleanup007
IF EXIST AtomicHeart-Win*-Shipping.exe GOTO cleanupAH
IF EXIST afop.exe GOTO cleanupAFOP
IF EXIST afop_plus.exe GOTO cleanupAFOP
IF EXIST bg3_dx11.exe GOTO cleanupBG3
IF EXIST CrimsonDesert.exe GOTO cleanupCD
IF EXIST Cyberpunk2077.exe GOTO cleanupCP2077
IF EXIST DarkSoulsRemastered.exe GOTO cleanupDSR
IF EXIST DarkSoulsII.exe GOTO cleanupDS2
IF EXIST DarkSoulsIII.exe GOTO cleanupDS3
IF EXIST DaysGone.exe GOTO cleanupDG
IF EXIST "Dead Space.exe" GOTO cleanupDS2023
IF EXIST DeathStranding.exe GOTO cleanupDSDC
IF EXIST ds.exe GOTO cleanupDSDC
IF EXIST DS2.exe GOTO cleanupDS2OTB
IF EXIST DOOMx64vk.exe GOTO cleanupDOOM2016
IF EXIST DOOMEternalx64vk.exe GOTO cleanupDOOME
IF EXIST DOOMTheDarkAges.exe GOTO cleanupDOOMTDA
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
IF EXIST GTA5.exe GOTO cleanupGTA5
IF EXIST GTA5_Enhanced.exe GOTO cleanupGTA5E
IF EXIST Maine-Win*-Shipping.exe GOTO cleanupGROUNDED
IF EXIST Oregon-Win*-Shipping.exe GOTO cleanupHOL
IF EXIST HorizonForbiddenWest.exe GOTO cleanupHFW
IF EXIST HorizonZeroDawn.exe GOTO cleanupHZD
IF EXIST HorizonZeroDawnRemastered.exe GOTO cleanupHZDR
IF EXIST HogwartsLegacy.exe IF EXIST amd_fidelityfx_dx12.dll GOTO cleanupHogwarts
IF EXIST KingdomCome.exe GOTO cleanupKCD2
IF EXIST TheGreatCircle.exe GOTO cleanupIJTGC
IF EXIST mafiadefinitiveedition.exe GOTO cleanupMDE1
IF EXIST "Mafia II Definitive Edition.exe" GOTO cleanupMDE2
IF EXIST mafia3definitiveedition.exe GOTO cleanupMDE3
IF EXIST Outlaws.exe GOTO cleanupStarWarsOutlaws
IF EXIST Outlaws_Plus.exe GOTO cleanupStarWarsOutlaws
IF EXIST RDR2.exe GOTO cleanupRDR2
IF EXIST Spider-Man.exe GOTO cleanupSPIDERMAN
IF EXIST MilesMorales.exe GOTO cleanupSPIDERMANMM
IF EXIST Spider-Man2.exe GOTO cleanupSPIDERMAN2
IF EXIST Stray-Win64-Shipping.exe GOTO cleanupSTRAY
IF EXIST tlou-i.exe GOTO cleanupTLOU1
IF EXIST tlou-ii.exe GOTO cleanupTLOU2
IF EXIST u4.exe IF EXIST tll.exe GOTO cleanupULOTC
IF EXIST watch_dogs.exe GOTO cleanupWD1
IF EXIST WatchDogs2.exe GOTO cleanupWD2
IF EXIST WatchDogsLegion.exe GOTO cleanupWDL
ECHO This game is not supported for now.
GOTO abort

:cleanup007
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

:askReg_007
SET "ans=Y"
SET /P "ans=Restoring the graphics settings affected by the mod will reset them to their default values. Proceed anyway ? (Y/n) "
IF /I "%ans%"=="Y" GOTO doReg_007
IF /I "%ans%"=="YES" GOTO doReg_007
IF /I "%ans%"=="N" GOTO end
IF /I "%ans%"=="NO" GOTO end
ECHO Invalid answer, type Y or N.
GOTO askReg_007

:doReg_007
FOR %%V IN (DLSSQuality:0 Fullscreen:1 HDR:1 MotionBlur:1 VRSProfile:1 VSync:1) DO FOR /F "tokens=1,2 delims=:" %%A IN ("%%V") DO REG ADD "HKCU\Software\IO Interactive\007 First Light" /v %%A /t REG_DWORD /d %%B /f >NUL
ECHO Graphics settings restored.
GOTO end

:cleanupAFOP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\AFOP\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"

IF EXIST "%dst%graphic settings_ori.cfg" (
    MOVE /Y "%dst%graphic settings_ori.cfg" "%dst%graphic settings.cfg" >NUL
    IF EXIST "%dst%persistent_settings_ori.cfg" MOVE /Y "%dst%persistent_settings_ori.cfg" "%dst%persistent_settings.cfg" >NUL
    IF EXIST "%dst%state_ori.cfg" MOVE /Y "%dst%state_ori.cfg" "%dst%state.cfg" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupAH
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "dst=%LOCALAPPDATA%\AtomicHeart\Saved\Config\WindowsNoEditor\"
SET "dstGDK=%LOCALAPPDATA%\AtomicHeart\Saved\Config\WinGDK\"
SET "restored="
IF EXIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF EXIST "%dstGDK%GameUserSettings_ori.ini" (
    MOVE /Y "%dstGDK%GameUserSettings_ori.ini" "%dstGDK%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupBG3
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Larian Studios\Baldur's Gate 3\
SET "dst=%LOCALAPPDATA%%sub%"
IF EXIST "%dst%graphicSettings_ori.lsx" (
    MOVE /Y "%dst%graphicSettings_ori.lsx" "%dst%graphicSettings.lsx" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupCD
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Pearl Abyss\CD\save\
SET "dst=%LOCALAPPDATA%%sub%"
IF EXIST "%dst%user_engine_option_save_ori.xml" (
    MOVE /Y "%dst%user_engine_option_save_ori.xml" "%dst%user_engine_option_save.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupCP2077
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\CD Projekt Red\Cyberpunk 2077\
SET "dst=%LOCALAPPDATA%%sub%"
IF EXIST "%dst%UserSettings_ori.json" (
    MOVE /Y "%dst%UserSettings_ori.json" "%dst%UserSettings.json" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupDSR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\FromSoftware\NBGI\DarkSouls\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%DarkSouls_ori.ini" (
    MOVE /Y "%dst%DarkSouls_ori.ini" "%dst%DarkSouls.ini" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupDS2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=\DarkSoulsII\
SET "dst=%APPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_SOFS_ori.xml" (
    MOVE /Y "%dst%GraphicsConfig_SOFS_ori.xml" "%dst%GraphicsConfig_SOFS.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupDS3
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=\DarkSoulsIII\
SET "dst=%APPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_ori.xml" (
    MOVE /Y "%dst%GraphicsConfig_ori.xml" "%dst%GraphicsConfig.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupDG
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=\BendGame\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL 
) ELSE GOTO no_ori
GOTO end

:cleanupDS2023
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
SET sub=Dead Space (2023)\settings\
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "restored="
IF EXIST "%dst%ProfileOptions_profile_ori" (
    MOVE /Y "%dst%ProfileOptions_profile_ori" "%dst%ProfileOptions_profile" >NUL
    SET restored=yes
)
IF EXIST "%dst%steam\ProfileOptions_profile_ori" (
    MOVE /Y "%dst%steam\ProfileOptions_profile_ori" "%dst%steam\ProfileOptions_profile" >NUL
    SET restored=yes
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupDSDC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
IF ExIST "settings_ori.cfg" (
    MOVE /Y "settings_ori.cfg" "settings.cfg" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupDS2OTB
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

echo Restoring graphic settings...
:askReg_DS2OTB
SET "ans=Y"
SET /P "ans=Restoring the graphics settings to their default values ? (Y/n) "
IF /I "%ans%"=="Y" GOTO doReg_DS2OTB
IF /I "%ans%"=="YES" GOTO doReg_DS2OTB
IF /I "%ans%"=="N" GOTO end
IF /I "%ans%"=="NO" GOTO end
ECHO Invalid answer, type Y or N.
GOTO askReg_DS2OTB

:doReg_DS2OTB
REG DELETE "HKCU\Software\KOJIMA PRODUCTIONS\DEATH STRANDING 2 - ON THE BEACH\Graphics" /f >NUL 2>&1
ECHO Graphics settings restored.
GOTO end

:cleanupDOOM2016
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "RealVR*.ini" "openvr_api.dll" "RealConfig.bat" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

CALL :vulkanclean
GOTO end

:cleanupDOOME
echo Deleting mod files...
RMDIR /s /q "doomSandBox\RealRepo" "RealRepo"
DEL "doomSandBox\cudart64_12.dll" "doomSandBox\openvr_api.dll" "doomSandBox\RealVR*.ini" "cudart64_12.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

CALL :vulkanclean
GOTO end

:cleanupDOOMTDA
echo Deleting mod files...
RMDIR /s /q "doomSandBox\RealRepo" "RealRepo"
DEL "cudart64_12.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "BackupSaves.bat"

CALL :vulkanclean
GOTO end

:cleanupEldenRing
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"
IF EXIST start_protected_game_ori.exe MOVE /Y start_protected_game_ori.exe start_protected_game.exe >NUL

echo Restoring graphic settings...
SET sub=\EldenRing\
SET "dst=%APPDATA%%sub%"
IF ExIST "%dst%GraphicsConfig_ori.xml" (
    MOVE /Y "%dst%GraphicsConfig_ori.xml" "%dst%GraphicsConfig.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupFCND
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry New Dawn\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    MOVE /Y "%dst%gamerprofile_ori.xml" "%dst%gamerprofile.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupFCP
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry Primal\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    MOVE /Y "%dst%gamerprofile_ori.xml" "%dst%gamerprofile.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupFC4
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 4\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "restored="
IF NOT EXIST "%dst%" GOTO no_ori
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%" 2^>nul') DO (
    IF EXIST "%dst%%%D\GamerProfile_ori.xml" (
        MOVE /Y "%dst%%%D\GamerProfile_ori.xml" "%dst%%%D\GamerProfile.xml" >NUL
        SET "restored=yes"
    )
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupFC5
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 5\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    MOVE /Y "%dst%gamerprofile_ori.xml" "%dst%gamerprofile.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupFC6
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\Far Cry 6\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\gamerprofile_ori.xml" (
    MOVE /Y "%dst%gamerprofile_ori.xml" "%dst%gamerprofile.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupFF7R
SET "sub=My Games\FINAL FANTASY VII REMAKE\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "wne=%dst%Saved\Config\WindowsNoEditor\"
SET "ref=RealRepo\FF7R\Settings\Engine.ini"
SET "reset="

echo Restoring graphic settings...
IF EXIST "%wne%Engine_ori.ini" (
    MOVE /Y "%wne%Engine_ori.ini" "%wne%Engine.ini" >NUL
) ELSE IF EXIST "%wne%Engine.ini" (
    IF EXIST "%ref%" (
        FC /B "%wne%Engine.ini" "%ref%" >NUL 2>&1
        IF ERRORLEVEL 1 (
            echo WARNING: Engine.ini was modified after the install, left in place:
            echo          "%wne%Engine.ini"
        ) ELSE DEL /F /Q "%wne%Engine.ini"
    ) ELSE (
        echo WARNING: Unable to tell if this Engine.ini comes from the mod, left in place:
        echo          "%wne%Engine.ini"
    )
)

FOR %%P IN (EOS Steam) DO IF EXIST "%dst%%%P\" (
    FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%%%P" 2^>nul') DO (
        IF EXIST "%dst%%%P\%%D\ff7remakedevice_ori.sav" (
            MOVE /Y "%dst%%%P\%%D\ff7remakedevice_ori.sav" "%dst%%%P\%%D\ff7remakedevice.sav" >NUL
        ) ELSE IF EXIST "%dst%%%P\%%D\ff7remakedevice.sav" (
            DEL /F /Q "%dst%%%P\%%D\ff7remakedevice.sav"
            SET "reset=yes"
        )
    )
)
IF DEFINED reset (
    echo NOTE: Your FF7R display settings were not backed up at install time. They have been reset to default values, set them again in game.
)

echo Deleting mod files...
RMDIR /s /q "RealRepo" 2>nul
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" 2>nul

GOTO end

:cleanupFF7RB
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "sub=My Games\FINAL FANTASY VII REBIRTH\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "reset="
FOR %%P IN (EOS Steam) DO IF EXIST "%dst%%%P\" (
    FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%%%P" 2^>nul') DO (
        IF EXIST "%dst%%%P\%%D\ff7rebirthdevice_ori.sav" (
            MOVE /Y "%dst%%%P\%%D\ff7rebirthdevice_ori.sav" "%dst%%%P\%%D\ff7rebirthdevice.sav" >NUL
        ) ELSE IF EXIST "%dst%%%P\%%D\ff7rebirthdevice.sav" (
            DEL /F /Q "%dst%%%P\%%D\ff7rebirthdevice.sav"
            SET "reset=yes"
        )
    )
)
IF DEFINED reset (
    echo NOTE: Your FF7 Rebirth display settings were not backed up at install time. They have been reset to default values, set them again in game.
)
GOTO end


:cleanupGOT
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Sucker Punch Productions\Ghost of Tsushima DIRECTOR'S CUT\Graphics"
GOTO end

:cleanupGR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Ghostrunner\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
  
) ELSE GOTO no_ori
GOTO end

:cleanupGWT
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "ReShadePreset.ini" 2>nul
DEL "ReShadePreset.ini" "reshade-shaders\Shaders\CAS.fx" "reshade-shaders\Shaders\ReShade.fxh" "reshade-shaders\Textures\dummy" 2>nul
RMDIR "reshade-shaders\Shaders" "reshade-shaders\Textures" 2>nul
RMDIR "reshade-shaders" 2>nul

echo Restoring graphic settings...
SET "dst=%USERPROFILE%\Saved Games\TangoGameworks\"
SET "wne=\Saved\Config\WindowsNoEditor\"
SET "restored="
IF NOT EXIST "%dst%" GOTO no_ori
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%" 2^>nul') DO (
    IF EXIST "%dst%%%D%wne%GameUserSettings_ori.ini" (
        MOVE /Y "%dst%%%D%wne%GameUserSettings_ori.ini" "%dst%%%D%wne%GameUserSettings.ini" >NUL
        SET "restored=yes"
    )
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupGTA5
echo Deleting mod files...
RMDIR /s /q "asi" "Settings" "ShaderFixes"
DEL "RealVR*.ini" "d3d11.dll" "ScriptHookV.dll" "RealConfig.bat" "commandline.txt" "openvr_api.dll" "nvapi64.dll" "d3dx.ini" "dinput8.dll" "ScriptHookV.log" "asiloader.log" "args.txt" "NativeTrainer.asi"

echo Restoring graphic settings...
SET "sub=\Rockstar Games\GTA V\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%settings_ori.xml" (
    MOVE /Y "%dst%settings_ori.xml" "%dst%settings.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupGTA5E
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=\Rockstar Games\GTAV Enhanced\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%settings_ori.xml" (
    MOVE /Y "%dst%settings_ori.xml" "%dst%settings.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupGROUNDED
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "dst=%LOCALAPPDATA%\Maine\Saved\Config\WindowsNoEditor\"
SET "dstGDK=%LOCALAPPDATA%\Maine\Saved\Config\WinGDK\"
SET "restored="
IF EXIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF EXIST "%dstGDK%GameUserSettings_ori.ini" (
    MOVE /Y "%dstGDK%GameUserSettings_ori.ini" "%dstGDK%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupHOL
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"
IF NOT EXIST "..\..\..\Engine\Binaries\ThirdParty\OpenXR\win64\openxr_loader.dll" echo NOTE: Verify the integrity of the game files in Steam or the Xbox app to restore the OpenXR loader deleted by the installer.

echo Restoring graphic settings...
SET "dst=%LOCALAPPDATA%\Oregon\Saved\Config\WindowsNoEditor\"
SET "dstGDK=%LOCALAPPDATA%\Oregon\Saved\Config\WinGDK\"
SET "restored="
IF EXIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF EXIST "%dstGDK%GameUserSettings_ori.ini" (
    MOVE /Y "%dstGDK%GameUserSettings_ori.ini" "%dstGDK%GameUserSettings.ini" >NUL
    SET "restored=yes"
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupHFW
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Guerrilla Games\Horizon Forbidden West Complete Edition\Graphics"
GOTO end

:cleanupHZD
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=Horizon Zero Dawn\Saved Game\profile\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF EXIST "%dst%graphicsconfig_ori.ini" (
    MOVE /Y "%dst%graphicsconfig_ori.ini" "%dst%graphicsconfig.ini" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupHZDR
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Guerrilla Games\Horizon Zero Dawn Remastered\Graphics"
GOTO end

:cleanupHogwarts
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET sub=\Hogwarts Legacy\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupKCD2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
IF EXIST "..\..\user_ori.cfg" (
    MOVE /Y "..\..\user_ori.cfg" "..\..\user.cfg" >NUL
) ELSE DEL "..\..\user.cfg" 2>nul

SET "dst=%USERPROFILE%\Saved Games\kingdomcome2\profiles\default\"
IF EXIST "%dst%attributes_ori.xml" (
    MOVE /Y "%dst%attributes_ori.xml" "%dst%attributes.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupIJTGC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.json" "RealVR64.dll" "RealVR64.log"

CALL :vulkanclean
GOTO end

:cleanupMDE1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

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
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

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
DEL "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" "ReShadePreset.ini"

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
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll" 

echo Restoring graphic settings...
SET "sub=My Games\Outlaws\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF EXIST "%dst%graphic settings_ori.cfg" (
    MOVE /Y "%dst%graphic settings_ori.cfg" "%dst%graphic settings.cfg" >NUL
    IF EXIST "%dst%state_ori.cfg" MOVE /Y "%dst%state_ori.cfg" "%dst%state.cfg" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupRDR2
echo Deleting mod files...
RMDIR /s /q "RealRepo" "Settings"
DEL "RealVR_RDR2.asi" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "ScriptHookRDR2.dll" "RealVR64.dll" "dinput8.dll" "commandline.txt" "RealVR64.json" "RealVR64.log"

echo Removing Vulkan layer...
SET "layer=%~dp0RealVR64.json"
REG DELETE "HKCU\SOFTWARE\Khronos\Vulkan\ImplicitLayers" /v "%layer%" /f >NUL 2>&1
REG QUERY "HKLM\SOFTWARE\Khronos\Vulkan\ImplicitLayers" /v "%layer%" >NUL 2>&1
IF NOT ERRORLEVEL 1 powershell -NoProfile -Command "Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile -Command Remove-ItemProperty -Path HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers -Name ''%layer%'''"

echo Restoring graphic settings...
SET "sub=Rockstar Games\Red Dead Redemption 2\Settings\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF EXIST "%dst%system_ori.xml" (
    MOVE /Y "%dst%system_ori.xml" "%dst%system.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupSPIDERMAN
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Insomniac Games\Marvel's Spider-Man Remastered\Graphics"
GOTO end

:cleanupSPIDERMANMM
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Insomniac Games\Marvel's Spider-Man Miles Morales\Graphics"
GOTO end

:cleanupSPIDERMAN2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG delete "HKCU\Software\Insomniac Games\Marvel's Spider-Man 2\Graphics"
GOTO end

:cleanupSTRAY
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET sub=\Hk_project\Saved\Config\WindowsNoEditor\
SET "dst=%LOCALAPPDATA%%sub%"
IF ExIST "%dst%GameUserSettings_ori.ini" (
    MOVE /Y "%dst%GameUserSettings_ori.ini" "%dst%GameUserSettings.ini" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupTLOU1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "dst=%USERPROFILE%\Saved Games\The Last of Us Part I\users\"
SET "restored="
IF NOT EXIST "%dst%" GOTO no_ori
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%" 2^>nul') DO (
    IF EXIST "%dst%%%D\screeninfo_ori.cfg" (
        MOVE /Y "%dst%%%D\screeninfo_ori.cfg" "%dst%%%D\screeninfo.cfg" >NUL
        SET "restored=yes"
    )
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupTLOU2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring the graphics settings will delete the game graphics registry key. You will need to set your preferences again at the next launch.
REG DELETE "HKCU\Software\Naughty Dog\The Last of Us Part II\Graphics" /f
REG DELETE "HKCU\Software\Naughty Dog\The Last of Us Part II\UI" /v HudScaling /f

GOTO end

:cleanupULOTC
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log" "RealVR64.dll"

echo Restoring graphic settings...
SET "dst=Uncharted4_data\"
IF EXIST "%dst%screeninfo_ori.cfg" (
    MOVE /Y "%dst%screeninfo_ori.cfg" "%dst%screeninfo.cfg" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupWD1
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch_Dogs\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "restored="
IF NOT EXIST "%dst%" GOTO no_ori
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%" 2^>nul') DO (
    IF EXIST "%dst%%%D\GamerProfile_ori.xml" (
        MOVE /Y "%dst%%%D\GamerProfile_ori.xml" "%dst%%%D\GamerProfile.xml" >NUL
        SET "restored=yes"
    )
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:cleanupWD2
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch_Dogs 2\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
IF ExIST "%dst%\WD2_GamerProfile_ori.xml" (
    MOVE /Y "%dst%WD2_GamerProfile_ori.xml" "%dst%WD2_GamerProfile.xml" >NUL
) ELSE GOTO no_ori
GOTO end

:cleanupWDL
echo Deleting mod files...
RMDIR /s /q "RealRepo"
DEL "cudart64_12.dll" "dxgi.dll" "openvr_api.dll" "RealConfig.bat" "RealVR*.ini" "RealVR64.log"

echo Restoring graphic settings...
SET "sub=My Games\Watch Dogs Legion\"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc1%%sub%" SET "doc=%doc1%"
IF NOT EXIST "%doc%%sub%" IF EXIST "%doc2%%sub%" SET "doc=%doc2%"
SET "dst=%doc%%sub%"
SET "restored="
IF NOT EXIST "%dst%" GOTO no_ori
FOR /F "delims=" %%D IN ('DIR /AD /B "%dst%" 2^>nul') DO (
    IF EXIST "%dst%%%D\WD3_GamerProfile_ori.xml" (
        MOVE /Y "%dst%%%D\WD3_GamerProfile_ori.xml" "%dst%%%D\WD3_GamerProfile.xml" >NUL
        SET "restored=yes"
    )
)
IF NOT DEFINED restored GOTO no_ori
GOTO end

:no_ori
echo It seems that there are no graphic presets created by the R.E.A.L. mod. Skipping graphic settings restoration...
GOTO end

:vulkanclean
echo Removing Vulkan layer...
echo NOTE: This Vulkan layer is shared by DOOM, DOOM Eternal, DOOM: The Dark Ages and Indiana Jones. Removing it disables R.E.A.L. VR for all of these games.
CHOICE /C YN /M "Remove it now"
IF %ERRORLEVEL% NEQ 1 (
    echo Vulkan layer left in place.
    EXIT /B 0
)
powershell -NoProfile -NonInteractive -Command "Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Khronos\Vulkan\ImplicitLayers' -Name '*RealVR64.json' -ErrorAction SilentlyContinue; $p='HKLM:\SOFTWARE\Khronos\Vulkan\ImplicitLayers'; $d=Join-Path $env:ProgramData 'RealVR'; if (((Get-Item $p -ErrorAction SilentlyContinue).Property -like '*RealVR64.json') -or (Test-Path $d)) { try { Start-Process powershell -Verb RunAs -Wait -ErrorAction Stop -ArgumentList ('-NoProfile -Command Remove-ItemProperty -Path ' + $p + ' -Name *RealVR64.json -ErrorAction SilentlyContinue; Remove-Item -Recurse -Force ' + $d) } catch { Write-Host 'WARNING: Administrator rights were refused, the Vulkan layer is still installed.' } }"
EXIT /B 0

:abort
echo Execution aborted. Please report any issues on my GitHub: Yelodress
pause
EXIT /B 1

:end
echo All done, time to re-enjoy your game !
echo This script will remove itself after pressing any key
pause

DEL "LRCleaner.bat"