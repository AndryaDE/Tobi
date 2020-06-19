#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
;~ #include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"


Global $__BaChoTa_aim = 1

#region State


Func Battle_ChooseTarget($aim = 1) ;initator

	$__BaChoTa_aim = $aim
	Return __BaChoTa_state

EndFunc


Func __BaChoTa_state() ;state

	Select

		Case Adler($INVENTORY) Or Adler($BATTLE) Or Adler($OVERWORLD) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($NEWTECHNIQUE)

			PopState()

		Case Adler($BATTLE_CHOOSE_TARGET)

			__BaChoTa_aim()

	EndSelect

EndFunc


#endregion


#region Private


Func __BaChoTa_aim()

	Static $ts = 0
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Switch $__BaChoTa_aim
		Case 2
			Local $x = Random(755, 822, 1)
			Local $y = Random(183, 218, 1)
		Case 1
			Local $x = Random(813, 850, 1)
			Local $y = Random(303, 303, 1)
	EndSwitch

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x-1, $y, 0)
	Task(SecureClick)
	Task(Wait, 300)

EndFunc


#endregion
