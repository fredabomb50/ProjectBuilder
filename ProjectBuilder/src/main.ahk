#Include header.ahk


;MOVE THE PLOT FUNCTIONS TO AHK TEMPLATE FILES FOR EASY-ish READING

;==================================

Gui, 1:New,,Projectree
Gui 1:Add, Button, x10 y7 gBuild, Build!
Gui 1:Add, DropDownList, x125 y10 vProjectType, |C/C++|AHK
Gui 1:Show
return


Build:
  Gui 1:Submit, Nohide
  InputBox, name, Name it!, exclude filepath and extension.,,,,,,,,Enter name here


  switch ProjectType
  {
    Case "C/C++":
      PlotCTree(name)
    return

    Case "AHK":
      PlotAhkTree(name)
    return

    default:
      MsgBox, DEFAULTED
    return
  }
return


GuiEscape:
GuiClose:
ExitApp
