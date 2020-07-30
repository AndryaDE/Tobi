#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
;~ #include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\_Battle.au3"
;~ #include "..\Func\SecureTask.au3"
;~ #include "..\Func\_ClearKeys.au3"
#include "..\Func\Note.au3"

#include "Overworld_MovePatterDvd.au3"
#include "Battle_Escape.au3"
#include "Battle_ChooseTarget.au3"
#include "Battle_UseAbility.au3"
#include "MicroMan_UseItem.au3"
#include "MicroMan_Catch.au3"
#include "Misc_Confirmbutton.au3"
#include "Misc_NewTechnique.au3"
#include "MicroMan_Resupply.au3"


Global $__MacFreeTem_BattleStep = 0

#region State


Func MacroMan_FreeTem() ;initator

	$__MacFreeTem_BattleStep = 0

	Return __MacFreeTem_state

EndFunc


Func __MacFreeTem_state() ;state

	Select

		Case Adler($OVERWORLD)

			$__MacFreeTem_BattleStep = 0

			If Note("Temcard") == "low" Then
				AddState(MicroMan_Resupply, $MINITEMPORIUM_VENDOR, $FARMSPOT_GLASSYWAY_RAIBER)
			Else
				AddState(Overworld_MovePatterDvd, 8, -24)
			EndIf

		Case Adler($CONFIRMBUTTON)

			AddState(Misc_Confirmbutton)

		Case Adler($NEWTECHNIQUE)

			AddState(Misc_NewTechnique)

		Case Adler($BATTLE_CHOOSE_TARGET)

			AddState(Battle_ChooseTarget)

		Case Adler($BATTLE)

			Local $a = BattleScan() ;[0] EnemyCount

			If $a[0] == 2 Then
				AddState(Battle_Escape)
			Else
				__MacFreeTem_Battle()
			EndIf

		Case Adler($CATCH)

			AddState(MicroMan_Catch)

	EndSelect

EndFunc


#endregion


#region Private


Func __MacFreeTem_Battle()

	Switch $__MacFreeTem_BattleStep
		Case 0 To 1
			AddState(Battle_UseAbility, 1)
		Case 2 To 5
			AddState(MicroMan_UseItem, "TEMCARD", "CAPTURE")
		Case Else
			$__MacFreeTem_BattleStep = 0
			Return
	EndSwitch

	$__MacFreeTem_BattleStep += 1

EndFunc


#endregion
