#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"


#region State


Func Misc_Confirmbutton() ;initator

	Return __MisConFiBtn_state

EndFunc


Func __MisConFiBtn_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($BATTLE) Or Adler($INVENTORY)

			PopState()

		Case Adler($CONFIRMBUTTON)

			__MisConFiBtn_Pass()

	EndSelect

EndFunc


#endregion


#region Private


Func __MisConFiBtn_Pass()

	Static $ts
	If TimerDiff($ts) <= 1300 Then
		Return
	EndIf
	$ts = TimerInit()

	Task(SecureClick, "right")
	Task(Wait)

EndFunc


#endregion
