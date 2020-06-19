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


Func NPC_Vendor() ;initator

	Return __NpcVendor_state

EndFunc


Func __NpcVendor_state() ;state

	Select

		Case Adler($VENDOR) Or Adler($BATTLE) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($INVENTORY)

			PopState()

		Case Adler($OVERWORLD)

			__NpcVendor_Talk()

;~ 		Case Adler($NPCDIALOG_BTN1)

		Case Adler($NPCDIALOG)

			__NpcVendor_Btn()
			__NpcVendor_Open()

	EndSelect

EndFunc


#endregion


#region Private


Func __NpcVendor_Talk()

	Static $ts
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Task(Send, "f")

EndFunc


Func __NpcVendor_Btn()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(894, 964, 1)
	Local $y = Random(329, 347, 1)

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y)

EndFunc


Func __NpcVendor_Open()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	Task(SecureClick)
	Task(Wait)

EndFunc



#endregion
