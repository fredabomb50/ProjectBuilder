#Include header.ahk


;MOVE THE PLOT FUNCTIONS TO AHK TEMPLATE FILES FOR EASY-ish READING

;==================================

Gui, 1:New,,Projectree
Gui 1:Add, Button, x10 y35 gBuild, Build!
Gui 1:Add, DropDownList, x11 y7 vPlatform gSwitcher, |Windows|Linux|iOS|MacOS|Android|Pi
Gui 1:Add, DropDownList, x150 y7 vWindows, |C|C++|AHK|Batch
Gui 1:Add, DropDownList, x150 y7 vLinux, |C|C++

GuiControl, Hide, Windows
GuiControl, Hide, Linux
Gui 1:Show
return


Switcher:
  Gui 1:Submit, Nohide

  if (Platform == "Windows")
  {
    GuiControl, Show, Windows
    GuiControl, Hide, Linux
  }
  else if (Platform == "Linux")
  {
    GuiControl, Show, Linux
    GuiControl, Hide, Windows
  }
  else
  {
    MsgBox, No selection!
  }

return

Build:
  Gui 1:Submit, Nohide
  InputBox, name, Name it!, exclude filepath and extension.,,,,,,,,Enter name here


  switch Platform
  {
    Case "Windows":
      switch Windows
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
          MsgBox, switch on windows failed
        return
      }
    return


    Case "Linux":
      switch Unix
      {
        Case "C":
          PlotCTree(name)
        return

        Case "C++":
          PlotCTree(name)
        return

        default:
          MsgBox, switch on linux failed
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
