#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\SecureTask.au3"

Global $__InvOp_tabName = ""


#region State


Func Inventory_Open($tabName = "") ;initator

	$__InvOp_tabName = StringUpper($tabName)

	Return __InvOp_state

EndFunc


Func __InvOp_state() ;state

	Select

		Case Adler($BATTLE_CHOOSE_TARGET) Or Adler($CATCH) Or Adler($CONFIRMBUTTON)

			PopState()

		Case Adler($OVERWORLD)

			__InvOp_Overworld()

		Case Adler($BATTLE)

			__InvOp_Battle()

		Case Adler($INVENTORY)

			If $__InvOp_tabName = "" Or Adler(Eval("INVENTORY_" & $__invOp_tabName)) Then
				PopState()
			Else
				__InvOp_TabOpen()
			EndIf

	EndSelect

EndFunc


#endregion


#region Private OpenTab


Func __InvOp_TabOpen()

	Static $ts = 0

	If TimerDiff($ts) >= 5000 Then

		$ts = TimerInit()

		Switch $__invOp_tabName
			Case "CAPTURE"
				Local $x = Random(492, 515, 1)
				Local $y = Random(21, 41, 1)
			Case "ITEMS"
				Local $x = Random(426, 452, 1)
				Local $y = Random(17, 42, 1)
		EndSwitch
		Task(SecureMove, $x, $y)
		Task(SecureMove, $x+1, $y, 0)
		Task(SecureClick)
		Task(Wait)

	EndIf

EndFunc


#endregion


#region Open

Func __InvOp_Overworld()

	Static $ts = 0

	If TimerDiff($ts) >= 2000 Then

		$ts = TimerInit()
		Task(Send, "i")

	EndIf

EndFunc

Func __InvOp_Battle()

	Local $x = Random(575, 605, 1)
	Local $y = Random(593, 625, 1)
	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(Wait)

EndFunc

#endregion