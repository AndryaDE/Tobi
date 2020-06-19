#include-once
#include <Misc.au3>
#include "..\Layer\TaskScheduler.au3"


#region Secure MouseMove

Func SecureMove($x, $y, $s = 5)

	Local $pos = MouseGetPos()

	If $pos[0] <> $x Or $pos[1] <> $y Then

		Task(MouseMove, $x, $y, $s)
		Task(SecureMove, $x, $y, $s)

	EndIf

EndFunc

#endregion

#region Secure MouseClick

Func SecureClick($btn = "left", $press = -1)

	Switch $btn
		Case "left", "primary"
			Local $code = "01"
		Case "right", "secondary"
			Local $code = "02"
		Case "middle"
			Local $code = "04"
	EndSwitch

	If $press == -1 Then
		__SecMouseClick($btn, $code, True)
		Task(__SecMouseClick, $btn, $code, False)
	Else
		__SecMouseClick($btn, $code, $press)
	EndIf

EndFunc


Func __SecMouseClick($btn, $code, $press)

	If _IsPressed($code) <> $press Then

		Local $mouseFunc = $press ? MouseDown : MouseUp

		Task($mouseFunc, $btn)
		Task(__SecMouseClick, $btn, $code, $press)

	EndIf

EndFunc

#endregion