@echo off

REM place it at "C:\Users\<USERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\winrc.bat"

set tcl_shell=C:\Tcl\bin
call :doesFileExist %tcl_shell%

set modelsim_exec=C:\modeltech64_10.5g\win64
call :doesFileExist %modelsim_exec%

set LM_LICENSE_FILE=<YOUR LICENSE HERE>

REM PUT THIS INTO A FUNCTION!!!
set QSYS_ROOTDIR=C:\intelFPGA_pro\18.0\qsys
call :doesFileExist %QSYS_ROOTDIR%
setx QSYS_ROOTDIR %QSYS_ROOTDIR%

set QUARTUS_ROOTDIR=C:\intelFPGA_pro\18.0\quartus
call :doesFileExist %QUARTUS_ROOTDIR%
setx QUARTUS_ROOTDIR %QUARTUS_ROOTDIR%

rem set SOPC_KIT_NIOS2=C:\intelFPGA_pro\18.0\nios2eds
rem call :doesFileExist %SOPC_KIT_NIOS2%
rem setx SOPC_KIT_NIOS2 %SOPC_KIT_NIOS2%

call :setVar SOPC_KIT_NIOS2 C:\intelFPGA_pro\18.0\nios2eds

rem set QSYS_ROOTDIR=C:\intelFPGA\16.1\quartus\sopc_builder\bin
rem call :doesFileExist %QSYS_ROOTDIR%
setx QSYS_ROOTDIR %QSYS_ROOTDIR%

setx Path "%tcl_shell%;%modelsim_exec%"


set /p MESSAGE=Hit ENTER to finish...

:doesFileExist
  IF EXIST %~1 ( echo Found %~1 ) ^
  ELSE ( echo Can NOT find %~1 & pause & cmd /c exit -1073741510)
  EXIT /B 0

: setVar
  set thisVar=%~1
  set thisPath=%~2
  call :doesFileExist %thisPath%
  setx %thisVar% %thisPath%
  echo %thisVar%%thisPath%
