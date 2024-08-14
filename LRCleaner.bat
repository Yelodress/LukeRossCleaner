@echo off

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

echo Hogwarts Legacy now cleaned. Please report any issues on my GitHub: Yelodress
pause