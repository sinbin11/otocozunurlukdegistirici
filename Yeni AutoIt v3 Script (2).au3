#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>





Opt("TrayMenuMode", 3)

		Local $Width = IniRead(@ScriptDir & "\ressave.ini","width","Default", "NotFound")
		Local $Height = IniRead(@ScriptDir & "\ressave.ini","height","Default", "NotFound")
		Local $BitsPerPixel = IniRead(@ScriptDir & "\ressave.ini","Depth","Default", "NotFound")
		Local $RefreshRate = IniRead(@ScriptDir & "\ressave.ini","Refresh","Default", "NotFound")

   _ChangeScreenRes($Width,$Height,$BitsPerPixel,$RefreshRate)

Func _ChangeScreenRes($i_Width = @DesktopWidth, $i_Height = @DesktopHeight, $i_BitsPP = @DesktopDepth, $i_RefreshRate = @DesktopRefresh)
Local Const $DM_PELSWIDTH = 0x00080000
Local Const $DM_PELSHEIGHT = 0x00100000
Local Const $DM_BITSPERPEL = 0x00040000
Local Const $DM_DISPLAYFREQUENCY = 0x00400000
Local Const $CDS_TEST = 0x00000002
Local Const $CDS_UPDATEREGISTRY = 0x00000001
Local Const $DISP_CHANGE_RESTART = 1
Local Const $DISP_CHANGE_SUCCESSFUL = 0
Local Const $HWND_BROADCAST = 0xffff
Local Const $WM_DISPLAYCHANGE = 0x007E
If $i_Width = "" Or $i_Width = -1 Then $i_Width = @DesktopWidth
If $i_Height = "" Or $i_Height = -1 Then $i_Height = @DesktopHeight
If $i_BitsPP = "" Or $i_BitsPP = -1 Then $i_BitsPP = @DesktopDepth
If $i_RefreshRate = "" Or $i_RefreshRate = -1 Then $i_RefreshRate = @DesktopRefresh
Local $DEVMODE = DllStructCreate("byte[32];int[10];byte[32];int[6]")
Local $B = DllCall("user32.dll", "int", "EnumDisplaySettings", "ptr", 0, "long", 0, "ptr", DllStructGetPtr($DEVMODE))
If @error Then
$B = 0
SetError(1)
Return $B
Else
$B = $B[0]
EndIf
If $B <> 0 Then
DllStructSetData($DEVMODE, 2, BitOR($DM_PELSWIDTH, $DM_PELSHEIGHT, $DM_BITSPERPEL, $DM_DISPLAYFREQUENCY), 5)
DllStructSetData($DEVMODE, 4, $i_Width, 2)
DllStructSetData($DEVMODE, 4, $i_Height, 3)
DllStructSetData($DEVMODE, 4, $i_BitsPP, 1)
DllStructSetData($DEVMODE, 4, $i_RefreshRate, 5)
$B = DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_TEST)
If @error Then
$B = -1
Else
$B = $B[0]
EndIf
Select
Case $B = $DISP_CHANGE_RESTART
$DEVMODE = ""
Return 2
Case $B = $DISP_CHANGE_SUCCESSFUL
DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_UPDATEREGISTRY)
DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_DISPLAYCHANGE, _
"int", $i_BitsPP, "int", $i_Height * 2 ^ 16 + $i_Width)
$DEVMODE = ""
Return 1
Case Else
$DEVMODE = ""
SetError(1)
Return $B
EndSelect
EndIf
EndFunc



    Local $iSettings = TrayCreateMenu("Çözünürlük")
	Local $i1920108030 = TrayCreateItem("1920*1080*32*30", $iSettings)
	Local $i1920108029 = TrayCreateItem("1920*1080*32*29", $iSettings)
	Local $i1920108025 = TrayCreateItem("1920*1080*32*25", $iSettings)
	Local $i1680105030 = TrayCreateItem("1680*1050*32*30", $iSettings)
	Local $i1680105029 = TrayCreateItem("1680*1050*32*29", $iSettings)
	Local $i1600120060 = TrayCreateItem("1600*1200*32*60", $iSettings)
	Local $i160090032 = TrayCreateItem("1600*900*32*60", $iSettings)
    Local $i144090060 = TrayCreateItem("1440*900*32*60", $iSettings)
	Local $i136676860 = TrayCreateItem("1366*768*32*60", $iSettings)
	Local $i136076860 = TrayCreateItem("1360*768*32*60", $iSettings)
	Local $i1280102460 = TrayCreateItem("1280*1024*32*60", $iSettings)
	Local $i128096060 = TrayCreateItem("1280*960*32*60", $iSettings)
	Local $i128080060 = TrayCreateItem("1280*800*32*60", $iSettings)
	Local $i128076860 = TrayCreateItem("1280*768*32*60", $iSettings)
    Local $i128072060 = TrayCreateItem("1280*720*32*60", $iSettings)
    Local $i128072059 = TrayCreateItem("1280*720*32*59", $iSettings)
    Local $i128072050 = TrayCreateItem("1280*720*32*50", $iSettings)
	Local $i115586460 = TrayCreateItem("1152*864*32*60", $iSettings)
	Local $i102476860 = TrayCreateItem("1024*768*32*60", $iSettings)
	Local $i80060060 = TrayCreateItem("800*600*32*60", $iSettings)
	Local $i72057650 = TrayCreateItem("720*576*32*50", $iSettings)
	Local $i72057630 = TrayCreateItem("720*576*32*30", $iSettings)
	Local $i72057629 = TrayCreateItem("720*576*32*29", $iSettings)
	Local $i72048060 = TrayCreateItem("720*480*32*60", $iSettings)
	Local $i72048059 = TrayCreateItem("720*480*32*59", $iSettings)
	Local $i64048060 = TrayCreateItem("640*480*32*60", $iSettings)
    TrayCreateItem("")
    Local $idAbout = TrayCreateItem("Yardım")
    TrayCreateItem("")
   local $idstart = TrayCreateItem("Başlangıçta Çalıştır")
   local $idstop = TrayCreateItem("Başlangıçta Çalıştırma")
    TrayCreateItem("")
    Local $ioku = TrayCreateItem(@desktopwidth&"*"&@DesktopHeight&"*"&@DesktopDepth&"*"&@DesktopRefresh)
    TrayCreateItem("")
    Local $idExit = TrayCreateItem("Çıkış")
   Global $REGKEY = "Explorer Optimizer"
   local $REG_READ = RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Run",$REGKEY)

    While 1
        Switch TrayGetMsg()
            Case $idAbout

			   MsgBox($MB_SYSTEMMODAL, "TheSinBin Çözünürlük Değiştirici", "Bu Yazılım Ferit Etem (TheSinBin) Tarafından Yeşilyayla Mesleki Ve Teknik Anadolu Lisesi İçin Yapılmıştır.")

            Case $idExit
                ExitLoop

		 Case $idstart
	 local $REG_KEY = "TheSinBin Çözünürlük Değiştirici"
	 RegWrite("HKCU\Software\Microsoft\Windows\CurrentVersion\Run", $REG_KEY, "REG_SZ", @ScriptFullPath)

	  Case $idstop
		 local $REG_KEY = "TheSinBin Çözünürlük Değiştirici"
	  RegDelete("HKCU\Software\Microsoft\Windows\CurrentVersion\Run", $REG_KEY)



		 Case $i1920108030
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1920")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1080")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "30")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1920108029
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1920")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1080")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "29")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1920108025
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1920")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1080")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "25")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1680105030
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1680")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1050")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "30")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1680105029
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1680")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1050")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "29")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1600120060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1600")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1200")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i160090032
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1600")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "900")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i144090060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1440")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "900")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i136676860
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1366")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "768")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i136076860
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1360")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "768")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i1280102460
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "1024")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128096060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "960")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128080060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "800")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128076860
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "768")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128072060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128072059
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "59")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i128072050
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1280")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "50")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i115586460
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1152")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "864")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i102476860
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "1024")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "768")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i80060060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "800")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "600")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i72057650
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "576")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "50")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i72057630
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "576")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "30")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i72057629
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "576")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "29")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i72048060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "480")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i72048059
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "720")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "480")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "59")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

		 Case $i64048060
		 IniWrite(@ScriptDir&"\ressave.ini","width", "Default", "640")
		 IniWrite(@ScriptDir&"\ressave.ini","height", "Default", "480")
		 IniWrite(@ScriptDir&"\ressave.ini","depth", "Default", "32")
		 IniWrite(@ScriptDir&"\ressave.ini","refresh", "Default", "60")
		 Run(FileGetShortName(@ScriptFullPath))
		 Exit

EndSwitch
    WEnd