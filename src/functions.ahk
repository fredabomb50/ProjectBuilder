SafelyCreateFile(filePath)
{
  file := FileOpen(filePath, "w")
  if (file)
  {
    file.Close()
  }
  else
  {
    ErrorPrompt(0x00)
  }

  return 0
}


SafelyWriteToFile(filePath, data)
{
  file := FileOpen(filePath, "w")
  if (file)
  {
    file.Write(data)
    file.Close()
  }
  else
  {
    ErrorPrompt(0x00)
  }

  return 0
}
