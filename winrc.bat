@echo off

rem C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

rem Set path:
set tcl_shell=C:\Tcl\bin
call :doesFileExist %tcl_shell%

set modelsim_exec=C:\modeltech64_10.5g\win64
call :doesFileExist %modelsim_exec%

setx Path "%tcl_shell%;%modelsim_exec%"

rem set LM_LICENSE_FILE=27001@ms2altera.syr.lmco.com
call :setVarToValue LM_LICENSE_FILE 27001@ms2altera.syr.lmco.com

rem Set enviroment variable/path pairs:
call :setVarToPath DVT_HOME C:\Eclipse\Eclipse-DVT-19.1.40-win_64\dvt_eclipse
call :setVarToPath QSYS_ROOTDIR C:\intelFPGA_pro\18.0\qsys
call :setVarToPath QUARTUS_ROOTDIR C:\intelFPGA_pro\18.0\quartus
call :setVarToPath SOPC_KIT_NIOS2 C:\intelFPGA_pro\18.0\nios2eds
call :setVarToPath QSYS_ROOTDIR %QSYS_ROOTDIR%


set /p MESSAGE=Hit ENTER to finish...

:doesFileExist
  IF EXIST %~1 ( echo Found %~1 ) ^
  ELSE ( echo Can NOT find %~1 & pause & cmd /c exit -1073741510)
  EXIT /B 0

:setVarToPath
  set thisVar=%~1
  set thisPath=%~2
  call :doesFileExist %thisPath%
  setx %thisVar% %thisPath%
  echo %thisVar%%thisPath%
  
: setVarToValue
  set thisVar=%~1
  set thisPath=%~2
  setx %thisVar% %thisPath%
  echo %thisVar%%thisPath%
