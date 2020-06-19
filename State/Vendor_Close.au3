#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\SecureTask.au3"
#include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"


#region State


Func Vendor_Close() ;initator

	Return __VenClose_state

EndFunc


Func __VenClose_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($BATTLE) Or Adler($INVENTORY)

			PopState()

		Case Adler($VENDOR)

			__VenClose_Close()

	EndSelect

EndFunc


#endregion


#region Private


Func __VenClose_Close()

	Static $ts
	If TimerDiff($ts) <= 600 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(93, 480, 1)
	Local $y = Random(397, 580, 1)
	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y)
	Task(SecureClick, "right")

EndFunc


#endregion
