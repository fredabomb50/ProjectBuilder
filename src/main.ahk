#Include header.ahk


;MOVE THE PLOT FUNCTIONS TO AHK TEMPLATE FILES FOR EASY-ish READING

;==================================

Gui, 1:New,,Projectree
Gui 1:Add, Button, x10 y35 gBuild, Build!
Gui 1:Add, DropDownList, x11 y7 vPlatform gSwitcher, |Windows|UNIX|iOS|MacOS|Android|Pi
Gui 1:Show
return


Switcher:
  Gui 1:Submit, Nohide


  if (Platform == Windows)
  {
    Gui 1:Add, DropDownList, x150 y7 vProjectTypes, C|C++|AHK|Batch
  }
  else if (Platform == UNIX)
  {
    Gui 1:Add, DropDownList, x150 y7 vProjectTypes, C|C++
  }


return

Build:
  Gui 1:Submit, Nohide
  InputBox, name, Name it!, exclude filepath and extension.,,,,,,,,Enter name here


  switch Platform
  {
    Case "Windows":
      switch WindowsProjects
      {
        Case "C":
          PlotCTree(name)
        return

        Case "C++":
          PlotCTree(name)
        return

        Case "AHK":
          PlotAhkTree(name)
        return

        default:
          MsgBox, test_project
        return
      }
    return


    Case "UNIX":
      switch UnixProjects
      {
        Case "C":
          PlotCTree(name)
        return

        Case "C++":
          PlotCTree(name)
        return


        default:
          MsgBox, test_project
        return
      }
    return


    Case "iOS":
      MsgBox, DEFAULTED
    return


    Case "MacOS":
      MsgBox, DEFAULTED
    return


    Case "Android":
      MsgBox, DEFAULTED
    return


    Case "Pi":
      MsgBox, DEFAULTED
    return
  }


return


GuiEscape:
GuiClose:
ExitApp
