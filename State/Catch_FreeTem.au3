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

Global $__CatFreeTem_Released = False

#region State


Func Catch_FreeTem() ;initator

	Return __CatFreeTem_state

EndFunc


Func __CatFreeTem_state() ;state

	Select

		Case Adler($OVERWORLD) Or Adler($BATTLE) Or Adler($CONFIRMBUTTON)

			If $__CatFreeTem_Released Then
				Local $freetem = Note("FreeTem", Null, 0) + 1
				Note("FreeTem", $freetem)
			EndIf

			PopState()

		Case Adler($CATCH)

			__CatFreeTem_Release1()

		Case Adler($CATCH_RELEASING)

			__CatFreeTem_Release2()
			$__CatFreeTem_Released = True

	EndSelect

EndFunc


#endregion


#region Private


Func __CatFreeTem_Release1()

	Static $ts
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(594, 651, 1)
	Local $y = Random(470, 491, 1)

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(Wait)

EndFunc

Func __CatFreeTem_Release2()

	Static $ts
	If TimerDiff($ts) <= 800 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $x = Random(485, 548, 1)
	Local $y = Random(389, 411, 1)

	Task(SecureMove, $x, $y)
	Task(SecureMove, $x+1, $y, 0)
	Task(SecureClick)
	Task(Wait)

EndFunc


#endregion
