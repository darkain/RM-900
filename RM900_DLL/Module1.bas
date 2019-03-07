Attribute VB_Name = "Module1"
Public Const WM_COMMAND = &H111
Public Const WM_USER = &H400
Global hwndWinamp As Long

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wparam As Long, ByVal lparam As Long) As Long

Public Sub StartLoop()
  
  Do
    DoEvents
    DirectXEvent_DXCallback 0
    Sleep (100)
    
    hwndWinamp = FindWindow("Winamp v1.x", vbNullString)
    If hwndWinamp = 0 Then
      Running = False
    End If
    
  Loop Until Running = False
  
  SaveSettings
End Sub

