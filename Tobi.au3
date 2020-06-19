#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Andrya

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------


#RequireAdmin

#region Presettings

#include "Config\AutoIt.au3"
#include "Func\Note.au3"

#endregion

#region Listeners

Listener("Log", ConsoleOutput)
Listener("FreeTem", eLog)
Listener("TemDeck", eLog)
Listener("Escapes", eLog)
Listener("Temcard", eLog)

Func eLog($log, $value)
	Switch $log
		Case "FreeTem"
			Note("Log", $value & " Tems freed")
		Case "TemDeck"
			Note("Log", $value & " Tems decked")
		Case "Escapes"
			Note("Log", $value & " Battles fled")
		Case "TEMCARD"
			Note("Log", $value & " quantity of Temcards")
		Case("SMOKEBOMB")
			Note("Log", $value & " quantity of Smokebomb")
	EndSwitch
EndFunc

#endregion

#region Layers

#include "Core\LayerEngine.au3"
#include "Layer\Controller.au3"
#include "Layer\WindowLayer.au3"
#include "Layer\TaskScheduler.au3"
#include "Layer\StateMachine.au3"

AddLayer(Controller)
AddLayer(WindowLayer, "Temtem")
AddLayer(TaskScheduler)
AddLayer(StateMachine)

#endregion

HotKeySet("!{RIGHT}",	"CtrlStart")
HotKeySet("!{LEFT}",		"CtrlStop")
HotKeySet("!{DEL}",		"CtrlExit")


#include "State\MacroMan_FreeTem.au3"
AddState(MacroMan_FreeTem)


CtrlStart()

; === MAIN LOOP, das Herzstück des Bots!!!ONEONE === ;
While(Sleep(1))

	LayerEngine()

WEnd


