@echo off

rem #######################################
rem # Put in the full path to your HandBrakeCLI.exe on line below <----------------
rem # EXAMPLE: [set HANDBRAKE_EXE_LOC="C:\HandBrakeCLI.exe"]
set HANDBRAKE_EXE_LOC=".\HandBrakeCLI.exe"
rem #######################################

rem #######################################
rem # Add any additional options as described in handbrakeCommands.txt to the [set HANDBRAKE_OPTIONS=] line below or leave blank 
rem # for handbrake defaults (do not set input and output options, as they are already set below) <----------------
rem # EXAMPLE: [set HANDBRAKE_OPTIONS=-r 10]
set HANDBRAKE_OPTIONS=
echo Other options enabled: %HANDBRAKE_OPTIONS%
rem #######################################

rem #######################################
rem # Chang/remove file name modifier or below (optional) <----------------
set OUTPUT_NAME_MODIFIER=_hb
rem #######################################


if not exist .\HandBrake_Output\ mkdir .\HandBrake_Output\

for %%i in (*.MTS, *.MOV, *.MP4, *.MPG, *.AVI, *.M4V, *.M4A, *.3GP, *.3G2, *.MJ2) do (
  echo processing: %%~nxi
  echo output file: "%%~ni%OUTPUT_NAME_MODIFIER%%%~xi"

  if exist "%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_" erase "%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_"
  if exist .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_" erase .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_"
  if exist .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi" erase .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi"
  if exist .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%.mp4" erase .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%.mp4"

  rem ###### The line below runs HandBrakeCLI with the the options specified above, do not modify.
  %HANDBRAKE_EXE_LOC% -i "%%i" -o "%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_" %HANDBRAKE_OPTIONS% >nul
  
  move "%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_" .\HandBrake_Output\
  rename .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi_" "%%~ni%OUTPUT_NAME_MODIFIER%.mp4"

  if not exist .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi" echo ERROR! File %%~nxi did not process correctly! Press any key to resume processing...
  if not exist .\HandBrake_Output\"%%~ni%OUTPUT_NAME_MODIFIER%%%~xi" pause

)

echo Files have finished processing through HandBrakeCLI!
echo Press any Key to Exit...
pause > nul