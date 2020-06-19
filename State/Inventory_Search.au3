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

Global $__InvSea_AdlrItem = ""
Global $__InvSea_Step = 0
Global $__InvSea_Started = False

#region State


Func Inventory_Search($itemName) ;initator

	$__InvSea_AdlrItem = Eval("ITEM_" & StringUpper($itemName))
	$__InvSea_Step = 0
	$__InvSea_Started = False

	Return __InvSea_state

EndFunc


Func __InvSea_state() ;state

	Select

		Case $__InvSea_Started And Adler($__InvSea_AdlrItem)

			PopState()

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($BATTLE)

			PopState()

		Case Adler($INVENTORY)

			__InvSea_Next()

	EndSelect

EndFunc


#endregion


#region Private


Func __InvSea_Next()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	$__InvSea_Started = True

	Local $x = Random(450, 505, 1)
	Switch $__InvSea_Step
		Case 0
			Local $y = Random(119, 140, 1)
		Case 1
			Local $y = Random(185, 210, 1)
		Case 2
			Local $y = Random(255, 276, 1)
		Case 3
			Local $y = Random(325, 349, 1)
		Case 4
			Local $y = Random(390, 418, 1)
		Case 5
			Local $y = Random(457, 483, 1)
		Case 6
			Local $y = Random(527, 555, 1)
		Case Else
			PopState()
			Return
	EndSwitch

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y)
	Task(Wait)

	$__InvSea_Step += 1

EndFunc


#endregion
