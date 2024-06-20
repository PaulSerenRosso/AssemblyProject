
@echo off
setlocal enabledelayedexpansion
echo Welcome to the build batch file.
set SCRIPTPATH=../game/scripts
set OBJPATH=../game/objs
set EXEPATH=../game/exes
set OBJECT_FILES=
cd nasm
 pause
REM pause
for %%f in (%SCRIPTPATH%/*.asm) do (
    echo Compiling %%~nf.asm
pause
	REM nasm -f bin %SCRIPTPATH%/%%~nf.asm -o %EXEPATH%/game.com
	 nasm -f obj %SCRIPTPATH%/%%~nf.asm -o %OBJPATH%/%%~nf.obj
	set OBJECT_FILES=!OBJECT_FILES! %OBJPATH%/%%~nf.obj
	pause
    
)
cd ../alinker 
echo Test !OBJECT_FILES!
 ALINK !OBJECT_FILES!  -o %EXEPATH%/game.exe
pause
cd ../dosbox/DOSBox-0.74-3/
start "" DOSBox.exe
pause
