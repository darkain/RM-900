VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CTRL_ALT_DEL"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long

Private Const RSP_SIMPLE_SERVICE = 1
Private Const RSP_UNREGISTER_SERVICE = 0

Public Sub Hide_In_CTRL_ALT_Delete()
  Dim pid As Long
  Dim regserv As Long
  pid = GetCurrentProcessId()
  regserv = RegisterServiceProcess(pid, RSP_SIMPLE_SERVICE)
End Sub

Public Sub Show_In_CTRL_ALT_DELETE()
  Dim pid As Long
  Dim regserv As Long
  pid = GetCurrentProcessId()
  regserv = RegisterServiceProcess(pid, RSP_UNREGISTER_SERVICE)
End Sub
