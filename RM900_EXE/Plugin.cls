VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Plugin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Implements IRjlWinAmpGenPlugin
Private m_Wrapper As IRjlWinAmpGenWrapper
Private m_Key As Long

Private Sub IRjlWinAmpGenPlugin_Configure()
'stuff
End Sub

Private Sub IRjlWinAmpGenPlugin_Initialize(ByVal Wrapper As RjlWinAmpGenLib.IRjlWinAmpGenWrapper)
  If Not This Is Nothing Then
      Err.Raise vbObjectError + 1, , "Already have a plugin instance"
      Exit Sub
  End If
  Set This = Me

' Remember our wrapper object - we need it for WinAmp properties
  Set m_Wrapper = Wrapper
  m_Wrapper.Description = "WinAmp Live!Drive Ir RM-900 Plug-In"
  'Hook m_Wrapper.HwndParent
  frmLog.Show 1
End Sub

Private Sub IRjlWinAmpGenPlugin_Quit()
  'Unhook m_Wrapper.HwndParent
End Sub
