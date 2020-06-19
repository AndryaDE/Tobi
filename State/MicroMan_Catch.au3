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
#include "Catch_FreeTem.au3"
#include "Catch_TemDeck.au3"


#region State


Func MicroMan_Catch() ;initator

	Return __MicCatch_state

EndFunc


Func __MicCatch_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($BATTLE) Or Adler($CONFIRMBUTTON)

			PopState()

		Case Adler($CATCH)

			If __MicCatch_IsWorth(__MicCatch_CheckDouble) Then

				AddState(Catch_TemDeck)

			Else

				AddState(Catch_FreeTem)

			EndIf

	EndSelect

EndFunc


#endregion

#region Private

Func __MicCatch_IsWorth($callback)

	Local $sv[7] = ["VIT", "STA", "ATK", "SPZ", "DEF", "RES", "SPD"]

	Local $name = ""
	Local $count = 0
	Local $sv50[7]

	For $i = 6 To 0 Step -1
		If Adler(Eval("CATCH_SV50" & $sv[$i])) Then
			$name &= ($count?" ":"") & StringLower($sv[$i])
			$count += 1
			$sv50[$i] = True
		EndIf
	Next

	If $count >= 3 Then
		Note("Log", "TemTem with 3+ SV50 discovered!")
	EndIf

	Return $callback($count, $name, $sv50)

EndFunc

Func __MicCatch_CheckDouble($count, $name, $sv)

	Switch $count
		Case 0 To 1
			Return False
		Case 3 To 7
			Return True
		Case 2
			If ($sv[0] And $sv[1]) _
			Or ($sv[2] And $sv[3]) _
			Or ($sv[4] And $sv[5]) _
			Or $sv[6] Then
				Return True
			Else
				Return False
			EndIf
	EndSwitch

EndFunc


#endregion

#cs

Func TemCatched($bac)

	If Adler($BATTLE) Or Adler($OVERWORLD) Or Adler($CONFIRMBUTTON) Then

		Static $catched = 0
		$catched += 1
		Info("Catch", $catched)

		PopLayer()
		Return True

	ElseIf Adler($TEMCATCHED_RENAME) Then

		AddLayer(TemCatchedRename)

	EndIf


	Static $ts = 0

	If TimerDiff($ts) >= 1000 Then

		Select
			Case Adler($TEMCATCHED)

				__teCa_sorting_out()

			Case Adler($TEMCATCHED_RELEASING)

				Task(MouseMove, Random(488, 548, 1), Random(393, 408, 1))
				Task(Wait, 300)
				Task(Send, "f")

			Case Else

				Return

		EndSelect

		$ts = TimerInit()

	EndIf

EndFunc



Func __teCa_catchOnlyLuma($count, $name, $sv)

	Switch $count

		Case 0 To 2

			__teCa_freeTem()

		Case 3 To 7

			__teCa_temDeck()

	EndSwitch

EndFunc



Func __teCa_catchemAllSv50($count, $name, $sv)

	Switch $count

		Case 0

			__teCa_freeTem()

		Case 3 To 7

			__teCa_temDeck()

		Case 1 To 2

			Static $renamed = false

			If $renamed Then

				__teCa_temDeck()
				$renamed = false

			Else

				__teCa_rename($name)
				$renamed = true

			EndIf

	EndSwitch

EndFunc


Func __teCa_freeTem()

	Task(MouseMove, Random(590, 658, 1), Random(469, 488, 1))
	Task(Wait, 300)
	Task(Send, "f")

EndFunc


Func __teCa_rename($rename)

	Task(MouseMove, Random(690, 756, 1), Random(469, 488, 1))
	Task(Wait, 300)
	Task(Send, "f")
	TemCatchedRename(True, $rename)

EndFunc


Func __teCa_temDeck()

	Task(MouseMove, Random(507, 548, 1), Random(474, 488, 1))
	Task(Wait, 300)
	Task(Send, "f")

EndFunc

#ce