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

Global $__BaUsAbi_ability

#region State


Func Battle_UseAbility($ability = 1) ;initator

	$__BaUsAbi_ability = $ability

	Return __BaUsAbi_state

EndFunc


Func __BaUsAbi_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($BATTLE_CHOOSE_TARGET) Or Adler($INVENTORY) Or Adler($CATCH) Or Adler($CONFIRMBUTTON)

			PopState()

		Case Adler($BATTLE)

			__BaUsAbi_use()

	EndSelect

EndFunc


#endregion


#region Private


Func __BaUsAbi_use()

	Static $ts
	If TimerDiff($ts) <= 600 Then
		Return
	EndIf
	$ts = TimerInit()

	Switch $__BaUsAbi_ability
		Case 1
			Local $x = Random(65,234,1)
			Local $y = Random(535,563,1)
		Case 2
			Local $x = Random(273,445,1)
			Local $y = Random(540,564,1)
		Case 3
			Local $x = Random(59,227,1)
			Local $y = Random(595,619,1)
		Case 4
			Local $x = Random(267,439,1)
			Local $y = Random(591,620,1)
	EndSwitch

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x-1, $y)
	Task(SecureClick)
	Task(Wait)

EndFunc


#endregion
