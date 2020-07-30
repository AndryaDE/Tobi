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
#include "Overworld_MovePatterDvd.au3"
#include "Battle_LumaSeek.au3"


#region State


Func Macroman_Luma() ;initator

	Return __MacLuma_state

EndFunc


Func __MacLuma_state() ;state

	Select

		Case Adler($OVERWORLD)
			AddState(Overworld_MovePatterDvd, -3, 0)

		Case Adler($BATTLE)
			AddState(Battle_LumaSeek)

	EndSelect

EndFunc


#endregion


#region Private


Func __MacLuma()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

EndFunc


#endregion
