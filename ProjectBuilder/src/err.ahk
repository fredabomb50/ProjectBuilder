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
