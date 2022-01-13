PlotCTree(ProjectName)
{
notes =
(
//NOT AN EMPTY FILE
)


main =
(
#include "header.h"



int main (void)
{

}
)


header =
(
//Standard Libraries
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>


//Platform Libraries


//Handmade Libraries
#include "macros.h"
#include "datatypes.h"
#include "err.h"
#include "functions.h"


//Globals


)


macros =
(
//Redefinitions
typedef char i8;
typedef short i16;
typedef int i32;
typedef long i64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;
typedef float f32;
typedef double f64;


//Quick Math


//Debugging
#define Logger(boolean, text) {if(boolean){LogEntry(boolean, text);}else{LogEntry(boolean, text);}}


)


datatypes =
(
//Enumerations



//Structures
)


error =
(
//GLOBALS
FILE* logFile;


i32 CreateLog(void)
{
  logFile = fopen("log.txt", "w");
  fclose(logFile);
  return 0;
}


i32 LogEntry_Step(bool stepSucceeded, const i8 entry[])
{
  logFile = fopen("log.txt", "w");
  if (stepSucceeded)
  {
    fprintf(logFile, "SUCCESS..........`%s\n", entry);
  }

  else
  {
    fprintf(logFile, "FAILURE..........`%s\n", entry);
  }


  fclose(logFile);
  return 0;
}


)


functions =
(
//generic functions
i32 PrintLine(FILE* file, const i8 LinetoPrint[])
{
  fprintf(file, "`%s\n", LinetoPrint);
  fclose(file);
  return 0;
}
)



batchBuildGCC =
(
@echo off

SET compilerPath=C:\Users\luis.pacheco\Documents\Tools\Msys2\mingw64\bin\
SET srcPath=C:\Users\luis.pacheco\Documents\C_Projects\Win32_Test\src\
SET destPath=C:\Users\luis.pacheco\Documents\C_Projects\Win32_Test\build\


PUSHD %compilerPath%
gcc %srcPath%main.cpp -o %destPath%Main.exe
POPD
)


batchBuildMSVC =
(
@echo off


:: PREPROCESSOR DEFINITIONS


:: MSVC DEBUGGER SPECIFIC
set debug=            -FC	&:: Produce the full path of the source code file
set debug=`%debug`%	    -Z7	&:: Produce debug information


:: WIN32 PATHING AND INCLUDES
set win32_path=		       ..\src\main.cpp


:: GENERAL COMPILER FLAGS
set compiler=               -nologo &:: Suppress Startup Banner
set compiler=`%compiler`%     -Oi     &:: Use assembly intrinsics where possible
set compiler=`%compiler`%     -MT     &:: Include CRT library in the executable (static link)
set compiler=`%compiler`%     -Gm-    &:: Disable minimal rebuild
set compiler=`%compiler`%     -GR-    &:: Disable runtime type info (C++)
set compiler=`%compiler`%     -W4     &:: Display warnings up to level 4
::set compiler=`%compiler`%     -WX     &:: Treat all warnings as errors


:: IGNORE WARNINGS
set compiler=`%compiler`%	-wd4201 	&:: Nameless struct/union
set compiler=`%compiler`%	-wd4100 	&:: Unused function parameter
set compiler=`%compiler`%	-wd4211   &:: nonstandard extension used: redefined extern to static
set compiler=`%compiler`%	-wd4189 	&:: Local variable not referenced
set compiler=`%compiler`%	-wd4127   &:: conditional expression is constant


:: OPTIMIZATIONS
set optimizations= -O2
set optimizations=`%optimizations`% -nologo
set optimizations=`%optimizations`% -Oi
set optimizations=`%optimizations`% -GR-


:: LAST OPTIONS
set end_options= /std:c++17
set end_options=`%end_options`% /EHsc
set end_options=`%end_options`% /IA32


:: WIN32 LINKER SWITCHES
set win32_link=             -subsystem:windows,5.2 &:: subsystem, 5.1 for x86
set win32_link=`%win32_link`% -opt:ref               &:: Remove unused functions


pushd ..\build
cl `%optimizations`% `%debug`% `%compiler`% `%defined`% `%win32_path`% `%end_options`% /link `%win32_link`%
popd
)



  ;root directory = project name
  root = %A_ScriptDir%\%ProjectName%
  FileCreateDir, %root%


  ;generic build directory
  build = %root%\build
  FileCreateDir, %build%


  ;generic docs directory
  docs = %root%\docs
  FileCreateDir, %docs%


  ;generic src directory
  src = %root%\src
  FileCreateDir, %src%


  notesFile = %docs%\notes.txt
  SafelyCreateFile(notesFile)
  SafelyWriteToFile(notesFile, notes)

  mainFile = %src%\main.cpp
  SafelyCreateFile(mainFile)
  SafelyWriteToFile(mainFile, main)

  headerFile = %src%\header.h
  SafelyCreateFile(headerFile)
  SafelyWriteToFile(headerFile, header)

  errFile = %src%\err.h
  SafelyCreateFile(errFile)
  SafelyWriteToFile(errFile, error)

  functionsFile = %src%\functions.h
  SafelyCreateFile(functionsFile)
  SafelyWriteToFile(functionsFile, function)

  macrosFile = %src%\macros.h
  SafelyCreateFile(macrosFile)
  SafelyWriteToFile(macrosFile, macros)

  datatypesFile = %src%\datatypes.h
  SafelyCreateFile(datatypesFile)
  SafelyWriteToFile(datatypesFile, datatypes)


  GCCbuildFile = %src%\GCCbuild.bat
  SafelyCreateFile(GCCbuildFile)
  SafelyWriteToFile(GCCbuildFile, batchBuildGCC)

  MSVCbuildFile = %src%\MSVCbuild.bat
  SafelyCreateFile(MSVCbuildFile)
  SafelyWriteToFile(MSVCbuildFile, batchBuildMSVC)



  return 0
}
