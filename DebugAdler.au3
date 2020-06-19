#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Andrya

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------


;~ #RequireAdmin

#region Presettings

#include "Config\AutoIt.au3"
#include "Config\Adler.au3"
#include "Func\Adler.au3"
#include "Func\Note.au3"

Listener("Log", ConsoleOutput)

#endregion

#region Layers

#include "Core\LayerEngine.au3"
#include "Layer\Controller.au3"
#include "Layer\WindowLayer.au3"
#include "Layer\StateMachine.au3"

AddLayer(Controller)
AddLayer(WindowLayer, "Temtem")
AddLayer(StateMachine)

#endregion

HotKeySet("!{DEL}",		"CtrlExit")

Global Const $ADLER = $BATTLE

#region DEBUG STATE

Func Debug()
	Return __debug
EndFunc

Func __debug()

	Local $curr = Adler($ADLER)

	Static $last = -1

	If $curr <> $last Then
		$last = $curr
		Note("Log", "Adler: " & String($curr))
	EndIf

EndFunc

#endregion

AddState(DEBUG)

CtrlStart()

; === MAIN LOOP, das Herzstück des Bots!!!ONEONE === ;
While(Sleep(1))

	LayerEngine()

WEnd

