Attribute VB_Name = "MainMod"
Option Explicit

Public Declare Sub InstallHook Lib "VBKeyboardHook.Dll" (ByVal hwnd As Long)
Public Declare Sub RemoveHook Lib "VBKeyboardHook.Dll" ()
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wparam As Long, ByVal lparam As Long) As Long

Type POINTAPI
  x As Long
  y As Long
End Type

Type msg
  hwnd As Long
  message As Long
  wparam As Long
  lparam As Long
  time As Long
  pt As POINTAPI
End Type

Public Const WM_COMMAND = &H111
Public Const WM_USER = &H400
Global hwndWinamp As Long

Public Function FileExist(FileName As String)
  On Error Resume Next
  Open FileName For Input As #1
  Close #1
  
  If Err.Number Then
    Err.Clear
    FileExist = False
  Else
    FileExist = True
  End If
End Function

