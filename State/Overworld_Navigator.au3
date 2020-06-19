#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Config\Navigation.au3"
#include "..\Func\Adler.au3"
#include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"
#include "Battle_Escape.au3"


Global $__OwNavi_nav		;array of strings
Global $__OwNavi_step	;position in array of strings


#region State


Func Overworld_Navigator($navigation) ;initator

	$__OwNavi_nav = $navigation
	$__OwNavi_step = 0

	Return __OwNavi_state

EndFunc


Func __OwNavi_state() ;state

	Select

		Case Adler($BATTLE)

			_ClearKeys()
			$__OwNavi_step -= 1
			AddState(Battle_Escape)

		Case Adler($INVENTORY)

			PopState()

		Case Adler($OVERWORLD)

			__OwNavi_navigate()

	EndSelect

EndFunc


#endregion


#region Private


Func __OwNavi_navigate()

	Static $ts
	If TimerDiff($ts) <= 300 Then
		Return
	EndIf
	$ts = TimerInit()

	If __OwNavi_isMoving() Then
		Return
	EndIf

	__OwNavi_stopLast()

	If Not __OwNavi_startNext() Then
		PopState()
		Return
	EndIf

EndFunc


#endregion


#region Private IsMoving


Func __OwNavi_isMoving()

	Static $oldPos = 0
	Local $currentPos = __OwNavi_getPosition()
	Local $ret = $currentPos <> $oldPos

	$oldPos = $currentPos
	Return $ret

EndFunc


Func __OwNavi_getPosition()

	Return PixelChecksum(1042, 46, 1111, 133, 5)

EndFunc


#endregion


#region Private Nav Last/Next


Func __OwNavi_stopLast()

	If $__OwNavi_step <= 0 Then
		Return
	EndIf

	Local $arg = __OwNavi_formTask($__OwNavi_nav[$__OwNavi_step-1], "up")

	Task(Send, $arg)
	Task(Wait, 300)
	Return True

EndFunc


Func __OwNavi_startNext()

	If UBound($__OwNavi_nav) <= $__OwNavi_step Then
		Task(Wait, 300)
		Return False
	EndIf

	Local $arg = __OwNavi_formTask($__OwNavi_nav[$__OwNavi_step], "down")

	Task(Send, $arg)
	Task(Wait, 1000)
	$__OwNavi_step += 1
	Return True

EndFunc


Func __OwNavi_formTask($raw, $press)

	Local $prefix = "{"
	Local $suffix = " " & $press & "}"
	Local $delimiter = $suffix & $prefix

	Local $split = StringSplit($raw, "", $STR_NOCOUNT)

	Local $arg = $prefix & _ArrayToString($split, $delimiter) & $suffix

	Return $arg

EndFunc


#endregion