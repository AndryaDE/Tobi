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


Func Misc_NewTechnique() ;initator

	Return __MisNewTecniq_state

EndFunc


Func __MisNewTecniq_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($BATTLE) Or Adler($INVENTORY) Or Adler($CONFIRMBUTTON)

			PopState()

		Case Adler($NEWTECHNIQUE)

			__MisNewTecniq_Pass()

	EndSelect

EndFunc


#endregion


#region Private


Func __MisNewTecniq_Pass()

	Static $ts
	If TimerDiff($ts) <= 1300 Then
		Return
	EndIf
	$ts = TimerInit()

	Task(SecureClick, "right")
	Task(Wait)

EndFunc


#endregion
