@echo off

rmdir /s /q "Phoenix\Binaries\Win64\RealRepo"
del "Phoenix\Binaries\Win64\cudart64_110.dll"
del "Phoenix\Binaries\Win64\dxgi.dll"
del "Phoenix\Binaries\Win64\openvr_api.dll"
del "Phoenix\Binaries\Win64\RealConfig.bat"
del "Phoenix\Binaries\Win64\RealVR.ini"
del "Phoenix\Binaries\Win64\RealVR64.log"

echo Hogwarts Legacy now cleaned. Please report any issues on my GitHub: Yelodress
pause