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
#include "MicroMan_UseItem.au3"
#include "Overworld_Navigator.au3"
#include "MicroMan_Buyer.au3"

Global $__MicResup_Step = 0
Global $__MicResup_navVendor
Global $__MicResup_navFarmspot

#region State


Func MicroMan_Resupply($navVendor, $navFarmspot) ;initator

	$__MicResup_Step = 0
	$__MicResup_navVendor = $navVendor
	$__MicResup_navFarmspot = $navFarmspot
	Return __MicResup_state

EndFunc


Func __MicResup_state() ;state

	Select

		Case Adler($BATTLE) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($INVENTORY)

			PopState()

		Case Adler($OVERWORLD)

			Switch $__MicResup_Step
				Case 0
					AddState(MicroMan_UseItem, "Smokebomb", "Items")
				Case 1
					AddState(Overworld_Navigator, $__MicResup_navVendor)
				Case 2
					AddState(MicroMan_Buyer)
				Case 3
					AddState(Overworld_Navigator, $__MicResup_navFarmspot)
				Case Else
					PopState()
			EndSwitch

			$__MicResup_Step += 1

	EndSelect

EndFunc


#endregion
