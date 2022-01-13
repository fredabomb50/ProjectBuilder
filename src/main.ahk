#Include header.ahk


;MOVE THE PLOT FUNCTIONS TO AHK TEMPLATE FILES FOR EASY-ish READING

;==================================

Gui, 1:New,,Projectree
Gui 1:Add, Button, x10 y35 gBuild, Build!
Gui 1:Add, DropDownList, x11 y7 vPlatform, |Windows|UNIX|iOS|MacOS|Android|Pi
Gui 1:Add, DropDownList, x150 y7 vProjectType, |C/C++|AHK|Batch
Gui 1:Show
return


Build:
  Gui 1:Submit, Nohide

  switch Platform
  {
    Case "Windows":
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
          MsgBox, test_project
        return
      }
    return


    Case "UNIX":
      InputBox, name, Name it!, exclude filepath and extension.,,,,,,,,Enter name here

      switch ProjectType
      {
        Case "C/C++":
          PlotCTree(name)
        return

        Case "AHK":
          MsgBox, AHK not available for UNIX systems!
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
