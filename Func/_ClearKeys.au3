#include-once
#include <Misc.au3>
#include "..\Layer\TaskScheduler.au3"

Func _ClearKeys()

	Local $bool = False

   If _IsPressed("57") Then	; 57 = W
	  Send("{w up}")
	  $bool = True
   EndIf

   If _IsPressed("53") Then	; 53 = S
	  Send("{s up}")
	  $bool = True
   EndIf

   If _IsPressed("41") Then	; 41 = A
	  Send("{a up}")
	  $bool = True
   EndIf

   If _IsPressed("44") Then	; 44 = D
	  Send("{d up}")
	  $bool = True
   EndIf

	If $bool Then
		Task(_ClearKeys)
	EndIf

EndFunc