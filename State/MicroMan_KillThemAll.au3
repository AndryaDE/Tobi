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
#include "..\Func\_Battle.au3"

#include "Battle_ChooseTarget.au3"
#include "Battle_UseAbility.au3"
#include "MicroMan_Catch.au3"
#include "Misc_NewTechnique.au3"
#include "Misc_Confirmbutton.au3"


Global $__MicKiTall_Action


#region State


Func MicroMan_KillThemAll() ;initator

	$__MicKiTall_Action = 0
	Return __MicKiTall_state

EndFunc


Func __MicKiTall_state() ;state

	Select

		Case Adler($OVERWORLD)
			PopState()

		Case Adler($BATTLE_CHOOSE_TARGET)
			__MicKiTall_chooseTarget()

		Case Adler($BATTLE)
			__MicKiTall_battle()

		Case Adler($CONFIRMBUTTON)
			AddState(Misc_Confirmbutton)

		Case Adler($NEWTECHNIQUE)
			AddState(Misc_NewTechnique)

		Case Adler($CATCH)
			AddState(MicroMan_Catch)

	EndSelect

EndFunc


#endregion


#region Private


Func __MicKiTall_chooseTarget()

	Static $ts = 0
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $a = BattleScan() ;[1] EnemyTopLeft [2] EnemyRightBottom

	AddState(Battle_ChooseTarget, ( $a[2] >= 1 ? 2 : 1 ) )

EndFunc


Func __MicKiTall_battle()

	Static $ts = 0
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	AddState(Battle_UseAbility)

EndFunc


#endregion
