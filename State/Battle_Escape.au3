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

Global $__BaEsc_Fleds = False

#region State


Func Battle_Escape() ;initator

	$__BaEsc_Fleds = False
	Return __BaEsc_state

EndFunc


Func __BaEsc_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($INVENTORY) Or Adler($BATTLE_CHOOSE_TARGET)

			If $__BaEsc_Fleds Then
				Local $fleds = Note("Escapes", Null, 0) + 1
				Note("Escapes", $fleds)
			EndIf

			PopState()

		Case Adler($BATTLE)

			$__BaEsc_Fleds = True
			__BaEsc_flee()

	EndSelect

EndFunc


#endregion


#region Private


Func __BaEsc_flee()

	Static $ts
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(569, 609, 1)
	Local $y = Random(533, 568, 1)

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x-1, $y, 0)
	Task(SecureClick)
	Task(Wait, 300)

EndFunc


#endregion
