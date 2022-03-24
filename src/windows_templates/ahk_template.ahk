PlotAhkTree(ProjectName)
{
main =
(
#Include header.ahk
;==================================FUNCTIONS

;==================================HOTSTRINGS

;==================================HOTKEYS
)


header =
(
;==================================SETTINGS
#NoEnv
SetWorkingDir `%A_ScriptDir`%
SendMode Input
CoordMode, Mouse, Screen
SetTitleMatchMode, 2
DetectHiddenWindows, On


;==================================GLOBALS


;==================================3RD PARTY LIBRARIES


;==================================HANDMADE LIBRARIES
#Include err.ahk
#Include functions.ahk


)


functions =
(
;NOT AN EMPTY FILE
)


hotkeys =
(
;NOT AN EMPTY FILE
)


hotstrings =
(
;NOT AN EMPTY FILE
)


error =
(
logFile := FileOpen(Log.txt, "w")
logFile.Close()


PrintToLog(file, result, entry)
{
	if (result)
	{
		log = SUCCESS..........%entry%`n
	}
	else
	{
		log = FAILURE..........%entry%`n
	}

	file.Write(log)
	file.Close()
	return 0
}


ErrorPrompt(HexValue)
{
  switch HexValue
  {
    Case 0x00:
      MsgBox, , FUNCTION - %HexValue%, Not yet implemented!
    return

    default:
      MsgBox, , DEFAULTED
    return
  }
  return
}
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


  mainFile = %src%\main.ahk
  SafelyCreateFile(mainFile)
  SafelyWriteToFile(mainFile, main)

  headerFile = %src%\header.ahk
  SafelyCreateFile(headerFile)
  SafelyWriteToFile(headerFile, header)

  errFile = %src%\err.ahk
  SafelyCreateFile(errFile)
  SafelyWriteToFile(errFile, error)

  functionsFile = %src%\functions.ahk
  SafelyCreateFile(functionsFile)
  SafelyWriteToFile(functionsFile, functions)

	hotkeysFile = %src%\hotkeys.ahk
  SafelyCreateFile(hotkeysFile)
  SafelyWriteToFile(hotkeysFile, hotkeys)

	hotstringsFile = %src%\hotstrings.ahk
	SafelyCreateFile(hotstringsFile)
	SafelyWriteToFile(hotstringsFile, hotstrings)

  return 0
}
