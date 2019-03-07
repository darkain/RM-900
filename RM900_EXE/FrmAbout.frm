VERSION 5.00
Begin VB.Form FrmAbout 
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Winamp RM-900 Plug-In - About"
   ClientHeight    =   3480
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5070
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3480
   ScaleWidth      =   5070
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "&Ok"
      Height          =   255
      Left            =   3480
      TabIndex        =   2
      Top             =   3120
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Height          =   1335
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "FrmAbout.frx":0000
      Top             =   1680
      Width           =   4575
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   150
      Picture         =   "FrmAbout.frx":0419
      ScaleHeight     =   1455
      ScaleWidth      =   4785
      TabIndex        =   0
      Top             =   120
      Width           =   4785
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "© Copyright 2001 Old Skew Software"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00F1CA62&
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   3120
      Width           =   2895
   End
End
Attribute VB_Name = "FrmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Me.Hide
End Sub
