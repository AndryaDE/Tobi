#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
#include "..\Func\Note.au3"

#include "Inventory_Search.au3"
#include "Inventory_Open.au3"

Global $__MicUseItm_Searched = False
Global $__MicUseItm_Inventored = False
Global $__MicUseItm_AdlrItem
Global $__MicUseItm_ItemName = ""
Global $__MicUseItm_TabName = ""

#region State


Func MicroMan_UseItem($itemName, $tabName) ;initator

	$__MicUseItm_Searched = False
	$__MicUseItm_Inventored = False
	$__MicUseItm_ItemName = $itemName
	$__MicUseItm_AdlrItem = Eval("ITEM_" & StringUpper($itemName))
	$__MicUseItm_TabName = $tabName

	Return __MicUseItm_state

EndFunc


Func __MicUseItm_state() ;state

	Select

		Case Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($BATTLE_CHOOSE_TARGET)

			PopState()

		Case Adler($OVERWORLD) Or Adler($BATTLE)

			If $__MicUseItm_Inventored Then
				PopState()
				Return
			EndIf

			AddState(Inventory_Open)

		Case Adler($INVENTORY)

			$__MicUseItm_Inventored = True

			If $__MicUseItm_Searched Then

				If Adler($__MicUseItm_AdlrItem) Then

					__MicUseItm_ItemLow()

					Task(__MicUseItm_UseIt)
					Task(Wait)
					Return
				EndIf

				Task(AddState, Inventory_Open, $__MicUseItm_TabName)

			EndIf

			AddState(Inventory_Search, $__MicUseItm_ItemName)
			$__MicUseItm_Searched = True

	EndSelect

EndFunc


#endregion


#region Private


Func __MicUseItm_UseIt()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	If Adler($__MicUseItm_AdlrItem) Then

		Task(SecureClick)
		Task(__MicUseItm_UseIt)
		Return

	EndIf

	PopState()

EndFunc


Func __MicUseItm_ItemLow()

	Static $ts
	If TimerDiff($ts) <= 0 Then
		Return
	EndIf
	$ts = TimerInit()

	ConsoleWrite("DEBUG ITEM LOW CHECK: " & $__MicUseItm_ItemName & @LF)

	If Adler($ITEM_LOW) Then
		Note(StringUpper($__MicUseItm_ItemName), "low")
	EndIf

EndFunc


#endregion
