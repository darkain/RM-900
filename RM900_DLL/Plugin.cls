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

Private Sub IRjlWinAmpGenPlugin_Initialize(ByVal Wrapper As RjlWinAmpGenLib.IRjlWinAmpGenWrapper)
  Set m_Wrapper = Wrapper
  m_Wrapper.Description = "Live!Drive RM-900 Plug-In v1.4 (Gen_RM900.Plugin.dll)"
  Call Shell(App.Path & "\RM900.exe")
End Sub

Private Sub IRjlWinAmpGenPlugin_Configure()
  'FrmConfig.Show 1
  Call MsgBox("Configuration is not needed with this, so why bother?", vbOKOnly, "WinAmp RM-900 Plug-In V1.4")
End Sub

Private Sub IRjlWinAmpGenPlugin_Quit()
  'stuff
End Sub
