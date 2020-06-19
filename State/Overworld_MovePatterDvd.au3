#cs ----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include-once
#include "..\Layer\StateMachine.au3"
#include "..\Layer\TaskScheduler.au3"
#include "..\Config\Adler.au3"
#include "..\Func\Adler.au3"
#include "..\Func\_ClearKeys.au3"
;~ #include "..\Func\Note.au3"

Global $__OwMpDvd_x_step = False
Global $__OwMpDvd_x_dist = 3
Global $__OwMpDvd_y_step = True
Global $__OwMpDvd_y_dist = 3

#region State


Func Overworld_MovePatterDvd($horizontal = -5, $vertical = 3) ;initator

	$__OwMpDvd_x_step = ( $horizontal <= 0 ? False : True )
	$__OwMpDvd_x_dist = ( $horizontal < 0 ? $horizontal * -1 : $horizontal ) * 100
	$__OwMpDvd_y_step = ( $vertical <= 0 ? False : True )
	$__OwMpDvd_y_dist = ( $vertical < 0 ? $vertical * -1 : $vertical ) * 100

	Return __OwMpDvd_state

EndFunc


Func __OwMpDvd_state() ;state

	Select

		Case Adler($BATTLE) Or Adler($INVENTORY)

			Task(_ClearKeys)
			PopState()

		Case Adler($OVERWORLD)

			__OwMpDvd_x()
			__OwMpDvd_y()

	EndSelect

EndFunc


#endregion


#region Private

Func __OwMpDvd_x()

	If $__OwMpDvd_x_dist <= 0 Then
		Return
	EndIf

	Static $ts = 0
	If TimerDiff($ts) <= $__OwMpDvd_x_dist Then
		Return
	EndIf
	$ts = TimerInit()

	If $__OwMpDvd_x_step Then ;Positive-Direction
		Task(Send, '{a up}{d down}')
	Else ;Negative-Direction
		Task(Send, '{d up}{a down}')
	EndIf

	$__OwMpDvd_x_step = Not $__OwMpDvd_x_step

EndFunc


Func __OwMpDvd_y()

	If $__OwMpDvd_y_dist <= 0 Then
		Return
	EndIf

	Static $ts = 0
	If TimerDiff($ts) <= $__OwMpDvd_y_dist Then
		Return
	EndIf
	$ts = TimerInit()

	If $__OwMpDvd_y_step Then ;Positive-Direction
		Task(Send, '{w up}{s down}')
	Else ;Negative-Direction
		Task(Send, '{s up}{w down}')
	EndIf

	$__OwMpDvd_y_step = Not $__OwMpDvd_y_step

EndFunc


#endregion
