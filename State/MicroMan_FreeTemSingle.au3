#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
;~ #include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
;~ #include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"

Global $__MicFreeTemS_Step = 0

#region State


Func MicroMan_FreeTemSingle() ;initator

	$__MicFreeTemS_Step = 0

	Return __MicFreeTemS_state

EndFunc


Func __MicFreeTemS_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($CONFIRMBUTTON)

		Case Adler($BATTLE)

		Case Adler($INVENTORY)

	EndSelect

EndFunc


#endregion


#region Private


Func __()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

EndFunc


#endregion
