#include-once
#include <Misc.au3>
#include "..\Func\Note.au3"


Global $__WL_WindowTitle = ""
Global $__WL_WindowCheck = False


#region Layer


Func WindowLayer($windowTitle = False) ;initator

	Select
		Case IsString($windowTitle)
			$__WL_WindowTitle = $windowTitle
			$__WL_WindowCheck = __WL_SingleWnd
		Case IsArray($windowTitle)
			$__WL_WindowTitle = $windowTitle
			$__WL_WindowCheck = __WL_MultiWnd
		Case Else
			$__WL_WindowCheck = __WL_NoWnd
	EndSelect

	Return __layer_WL

EndFunc


Func __layer_WL() ;layer

	Return $__WL_WindowCheck()

EndFunc


#endregion


#region Private


Func __WL_NoWnd()
EndFunc



Func __WL_SingleWnd()

	Static $hwnd

	If $hwnd <> WinGetHandle("[ACTIVE]") Then

		If $__WL_WindowTitle == WinGetTitle("[ACTIVE]") Then

			$hwnd = WinGetHandle("[ACTIVE]")
			Note("Log", "Window " & String($hwnd))

		ElseIf $hwnd Then

			$hwnd = False
			Note("Log", "Window Lost")

		EndIf

		Return True

	EndIf

EndFunc



Func __WL_MultiWnd()

	Static $hwnd

   If $hwnd <> WinGetHandle("[ACTIVE]") Then

		For $i = UBound($__WL_WindowTitle)-1 To 0 Step -1

			If $__WL_WindowTitle[$i] == WinGetTitle("[ACTIVE]") Then
				$hwnd = WinGetHandle("[ACTIVE]")
				Note("Log", "Window " & String($hwnd))
				Return False
			EndIf

		Next

		If $hwnd Then
			Note("Log", "Window Lost")
			$hwnd = False
		EndIf

		Return True

   EndIf

EndFunc


#endregion

