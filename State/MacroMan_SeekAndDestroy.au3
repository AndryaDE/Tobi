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
#include "MicroMan_KillThemAll.au3"
;~ #include "Battle_Escape.au3"
;~ #include "Battle_ChooseTarget.au3"
;~ #include "Battle_UseAbility.au3"
;~ #include "MicroMan_UseItem.au3"
;~ #include "MicroMan_Catch.au3"
#include "Misc_Confirmbutton.au3"
#include "Misc_NewTechnique.au3"
;~ #include "MicroMan_Resupply.au3"



#region State


Func MacroMan_SeekAndDestroy() ;initator

	Return __MacSeekDestro_state

EndFunc


Func __MacSeekDestro_state() ;state

   Select

	  Case Adler($OVERWORLD)

		 AddState(Overworld_MovePatterDvd, 0, 1)

	  Case Adler($BATTLE) Or Adler($BATTLE_CHOOSE_TARGET)

		 AddState(MicroMan_KillThemAll)

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


#endregion
