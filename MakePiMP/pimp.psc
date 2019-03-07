Name RM-900 Plug-In Installer
Text This will install the RM-900 Plug-In v1.4 for Winamp
OutFile Gen_RM900_Inst.exe
SetOutPath $VISDIR.
AddFile ..\Final\Gen_RM900.Plugin.dll
AddFile ..\Final\RM900.dll
AddFile ..\Final\RM900.exe
AddFile ..\Final\VBKeyboardHook.dll
AddFile ..\Final\Gen_RM900.txt
AddFile ..\Final\ThunderRT5Form.KEY
ExecFile "$VISDIR\RM900.exe" INSTALL
ExecFile "$WINDIR\notepad.exe" $VISDIR\Gen_RM900.txt
; Silent
