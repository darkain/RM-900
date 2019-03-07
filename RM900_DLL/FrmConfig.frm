VERSION 5.00
Begin VB.Form FrmConfig 
   Caption         =   "Form1"
   ClientHeight    =   3435
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5025
   LinkTopic       =   "Form1"
   ScaleHeight     =   229
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   335
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton SysTrayIcnCng 
      Caption         =   "SysTray Icon"
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   480
      Width           =   1215
   End
   Begin VB.PictureBox SysTrayIcn 
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   120
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   0
      Top             =   480
      Width           =   480
   End
End
Attribute VB_Name = "FrmConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  Dim DestPath As String
  Dim Inp As String
    
  DestPath = GetSettingString(HKEY_LOCAL_MACHINE, "Software\Creative Tech\Creative RemoteCenter\RcMan", "Path")
  
  Open DestPath & "\RcMan.ACC" For Input As #1
    Do Until EOF(1)
      Input #1, Inp
      If UCase(Left(Inp, 4)) = "ICON" Then
        'MsgBox DestPath & Mid(Inp, 6)
        SysTrayIcn.Picture = LoadPicture(DestPath & "\" & Mid(Inp, 6))
      End If
    Loop
  Close 1
End Sub

