VERSION 5.00
Begin VB.Form frmLog 
   Caption         =   "Winamp RM900 Plug-In"
   ClientHeight    =   615
   ClientLeft      =   -2940
   ClientTop       =   -2655
   ClientWidth     =   1560
   ControlBox      =   0   'False
   Icon            =   "frmLog.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   615
   ScaleWidth      =   1560
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   720
      Top             =   120
   End
   Begin VB.PictureBox PictureBox_SendTo 
      Height          =   375
      Left            =   120
      ScaleHeight     =   315
      ScaleWidth      =   435
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
End
Attribute VB_Name = "frmLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Favourites(19) As Long
Dim FavToggle As Integer
Dim ShiftDown As Boolean
Dim AltDown As Boolean
Dim CtrlDown As Boolean

Private Sub Form_Load()
  Dim i As Integer
  Dim SrcPath As String
  Dim DestPath As String
  Dim Inp As String
  Dim TmpVal As String
  
  SrcPath = App.Path & "\ThunderRT5Form.KEY"
  DestPath = GetSettingString(HKEY_LOCAL_MACHINE, "Software\Creative Tech\Creative RemoteCenter\RcMan", "Path")
  
  If UCase(Command) = "INSTALL" Then
    On Error Resume Next
    If Len(DestPath) < 2 Then
      MsgBox "RemoteCenter not found.", vbOKOnly, "RM-900 Plug-In Install"
    Else
      Call FileCopy(SrcPath, DestPath & "\KeyMap\ThunderRT5Form.KEY")
      Kill SrcPath
      
      Open DestPath & "\RCMan.CFG" For Input As #1
      Open DestPath & "\RCMan2.CFG" For Output As #2
        Do Until EOF(1)
          Input #1, Inp
          If UCase(Left$(Inp, 8)) = "PRIORITY" Then
            Select Case Mid(Inp, 9, 1)
              Case "1"
                TmpVal = Mid(Inp, 10)
                Print #2, "Priority1=ThunderRT5Form"
              Case Else
                Print #2, "PRIORITY" & Mid(Inp, 9, 1) & TmpVal
                TmpVal = Mid(Inp, 10)
              End Select
          Else
            Print #2, Inp
          End If
        Loop
      Close 2
      Close 1
      
      Kill DestPath & "\RCMan.CFG"
      Call FileCopy(DestPath & "\RCMan2.CFG", DestPath & "\RCMan.CFG")
      Kill DestPath & "\RCMan2.CFG"
      
    End If
    End
  End If
  
  If App.PrevInstance Then End
  
  Open App.Path & "\WinampLog.fav" For Binary As 1
    For i = 0 To 19
      Get 1, , Favourites(i)
    Next i
  Close 1
  
  Me.WindowState = 0
  Me.Show
  InstallHook PictureBox_SendTo.hwnd

  hwndWinamp = FindWindow("Winamp v1.x", vbNullString)
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Dim i As Integer
  Dim SrcPath As String
  Dim DestPath As String
  SrcPath = App.Path & "\ThunderRT5Form.KEY"
  DestPath = GetSettingString(HKEY_LOCAL_MACHINE, "Software\Creative Tech\Creative RemoteCenter\RcMan", "Path") & "\KeyMap\"
  
  Open App.Path & "\WinampLog.fav" For Binary As 1
    For i = 0 To 19
      Put 1, , Favourites(i)
    Next i
  Close 1
  
  If FileExist(DestPath & "Default.BAK") Then
    Kill DestPath & "Default.KEY"
    Call FileCopy(DestPath & "Default.BAK", DestPath & "Default.KEY")
    Kill DestPath & "Default.BAK"
  End If

  RemoveHook
  End
End Sub

Private Sub PictureBox_SendTo_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim a As Long
    
  If hwndWinamp = 0 Then
    If KeyCode = 131 Or KeyCode = 123 Or KeyCode = 16 Or KeyCode = 17 Or KeyCode = 18 Then
    Else
      Exit Sub
    End If
  End If
  
  Select Case KeyCode
    Case 126 'F15
      'Favourite 0
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(0 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
    
      'Display WinAmp KeyLog About
      If AltDown And Not CtrlDown And Not ShiftDown Then
        FrmAbout.Show
      End If
    
    Case 127 'F16
      'Favourite 1
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(1 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Repeat All
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40022, 0)
      End If
    
    Case 128 'F17
      'Favourite 2
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(2 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Shuffle
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40023, 0)
      End If
    
    Case 129 'F18
      'Favourite 3
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(3 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Double Size
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40165, 0)
      End If
    
    Case 130 'F19
      'Favourite 4
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(4 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Equalizer
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40036, 0)
      End If
    
    Case 131 'F20
      'Favourite 5
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(5 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Move To Top of List
      If ShiftDown And AltDown And Not CtrlDown Then
        a = SendMessage(hwndWinamp, WM_USER, 0, 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Toggle Favourites Lists
      If ShiftDown And CtrlDown And Not AltDown Then
        FavToggle = -FavToggle + 10
      End If
      
      'Playlist Editor
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40040, 0)
      End If
    
    Case 132 'F21
      'Prev Track
      If ShiftDown And CtrlDown And AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40048, 0)
      End If
      
      'Run Visualization
      If ShiftDown And AltDown And Not CtrlDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40192, 0)
      End If
      
      'Up By 10 In Playlist
      If ShiftDown And CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40197, 0)
      End If
      
      'Favourite 6
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(6 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Minibrowser
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40298, 0)
      End If
    
    Case 133 'F22
      'Next Track
      If ShiftDown And CtrlDown And AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40044, 0)
      End If
      
      'Down By 10 In Playlist
      If ShiftDown And CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40195, 0)
      End If
      
      'Favourite 7
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(7 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
    
      'Reload Skin
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40291, 0)
      End If
    
    Case 134 'F23
      'Play/Pause
      If ShiftDown And CtrlDown And AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, 0, 104)
        If a = 1 Or a = 3 Then 'Pause
          a = SendMessage(hwndWinamp, WM_COMMAND, 40046, 0)
        Else 'Play
          a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
        End If
      End If
        
      'Play Track
      If CtrlDown And AltDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
      
      'Skin Browser
      If ShiftDown And AltDown And Not CtrlDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40219, 0)
      End If
      
      'Rewind
      If ShiftDown And CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40144, 0)
      End If
              
      'Favourite 8
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(8 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
    
      'Reload WinAmp
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_USER, 0, 135)
      End If
    
    Case 135 'F24
      'Stop
      If ShiftDown And CtrlDown And AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40047, 0)
      End If
        
      'Random Track
      If CtrlDown And AltDown And Not ShiftDown Then
        Randomize
        a = SendMessage(hwndWinamp, WM_USER, 0, 124)
        a = SendMessage(hwndWinamp, WM_USER, Int(Rnd() * a), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
        
      'Fast Farward
      If ShiftDown And CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40148, 0)
      End If
      
      'Close
      If ShiftDown And AltDown And Not CtrlDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40001, 0)
      End If
      
      'Favourite 9
      If ShiftDown And Not CtrlDown And Not AltDown Then
        a = SendMessage(hwndWinamp, WM_USER, Favourites(9 + FavToggle), 121)
        a = SendMessage(hwndWinamp, WM_COMMAND, 40045, 0)
      End If
    
      'WinAmp About Box
      If AltDown And Not CtrlDown And Not ShiftDown Then
        a = SendMessage(hwndWinamp, WM_COMMAND, 40041, 0)
      End If
    
    Case 123 'Exit Program
      If AltDown = True Then
        Unload Me
      End If
      
    Case 48 To 57  'Set Favourites
      If AltDown And CtrlDown And Not ShiftDown Then
        Favourites(KeyCode - 48 + FavToggle) = SendMessage(hwndWinamp, WM_USER, 0, 125)
      End If
        
    Case 16 'Check for SHIFT key
      ShiftDown = True
    Case 17 'Check for CTRL key
      CtrlDown = True
    Case 18 'Check for ALT key
      AltDown = True
  End Select
End Sub

Private Sub PictureBox_SendTo_KeyUp(KeyCode As Integer, Shift As Integer)
  Select Case KeyCode
    Case 16
      ShiftDown = False
    Case 17
      CtrlDown = False
    Case 18
      AltDown = False
  End Select
End Sub

Private Sub Timer1_Timer()
  hwndWinamp = FindWindow("Winamp v1.x", vbNullString)
  If hwndWinamp = 0 Then Unload Me
End Sub
