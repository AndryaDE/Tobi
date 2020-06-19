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

Global $__VenBuy_itemName
Global $__VenBuy_quantity

#region State


Func Vendor_Buy($itemName) ;initator

	$__VenBuy_itemName = StringUpper($itemName)
	$__VenBuy_quantity = 0
	Return __VenBuy_state

EndFunc


Func __VenBuy_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($BATTLE) Or Adler($INVENTORY)

			PopState()

		Case Adler($VENDORQUANTITY)

			__VenBuy_BuyItem()

		Case Adler($VENDOR)

			__VenBuy_SelectItem()

	EndSelect

EndFunc


#endregion


#region Private


Func __VenBuy_BuyItem()

	Local $x = Random(633, 642, 1)
	Local $y = Random(315, 315, 1)
	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Task(SecureClick)
	Local $x1 = Random(553, 611, 1)
	Local $y1 = Random(414, 435, 1)
	Task(SecureMove, $x1, $y1)
	Task(SecureMove, $x1+1, $y1, 0)
	Task(SecureClick)
	Task(Note, $__VenBuy_itemName, "high")
	Task(PopState)
	Task(Wait)

EndFunc

Func __VenBuy_SelectItem()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(687, 1003, 1)
	Switch $__VenBuy_itemName
		Case "TEMCARD"
			Local $y = Random(397, 422, 1)
		Case "SMOKEBOMB"
			Local $y = Random(185, 218, 1)
	EndSwitch

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(Wait)

EndFunc


#endregion
