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

Global $__CatTemDeck_Enter = False

#region State


Func Catch_TemDeck() ;initator

	$__CatTemDeck_Enter = False
	Return __CatTemDeck_state

EndFunc


Func __CatTemDeck_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($BATTLE) Or Adler($CONFIRMBUTTON) Or Adler($NEWTECHNIQUE)

			If $__CatTemDeck_Enter Then
				Local $temdeck = Note("TemDeck", Null, 0) + 1
				Note("TemDeck", $temdeck)
			EndIf

			PopState()

		Case Adler($CATCH)

			__CatTemDeck_Enter()
			$__CatTemDeck_Enter = True

	EndSelect

EndFunc


#endregion


#region Private


Func __CatTemDeck_Enter()

	Static $ts
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(504, 557, 1)
	Local $y = Random(471, 488, 1)

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(Wait)

EndFunc


#endregion
