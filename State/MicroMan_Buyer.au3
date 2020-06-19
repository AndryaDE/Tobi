#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
;~ #include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
;~ #include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
#include "..\Func\Note.au3"
#include "NPC_Vendor.au3"
#include "Vendor_Close.au3"
#include "Vendor_Buy.au3"

Global $__MicBuyer_Bought = False

#region State


Func MicroMan_Buyer() ;initator

	$__MicBuyer_Bought = False
	Return __MicBuyer_state

EndFunc


Func __MicBuyer_state() ;state

	Select

		Case Adler($INVENTORY) Or Adler($CATCH) Or Adler($CONFIRMBUTTON) Or Adler($BATTLE)

		Case Adler($VENDOR)

			Select

				Case Note("TEMCARD") == "low"

					AddState(Vendor_Buy, "Temcard")

				Case Else

					PopState()
					AddState(Vendor_Close)

			EndSelect

		Case Adler($OVERWORLD)

			If $__MicBuyer_Bought Then

				PopState()

			Else

				AddState(NPC_Vendor)
				$__MicBuyer_Bought = True

			EndIf

	EndSelect

EndFunc


#endregion

