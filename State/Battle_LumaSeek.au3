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
;~ #include "..\Func\_Battle.au3"
#include "Battle_Escape.au3"
#include <Array.au3>


#region State


Func Battle_LumaSeek() ;initator

	Return __BaLuSe_state

EndFunc


Func __BaLuSe_state() ;state

	Select

		Case Adler($OVERWORLD)
			PopState()
			Note("Escapes", Note("Escapes, Null, 0") + 1)

		Case Adler($BATTLE)
			__BaLuSe_check()

	EndSelect

EndFunc


#endregion


#region Library


Func BattleEnemyCount()

	Local $count = 0
	Local $enemy1 = PixelGetColor(971, 77)
	Local $enemy2 = PixelGetColor(728, 43)

	If $enemy1 == 6788663 Or $enemy1 == 12546345 Or $enemy1 == 11149097 Then ;green, yellow, red
		$count += 1
	EndIf

	If $enemy2 == 6788663 Or $enemy2 == 12546345 Or $enemy2 == 11149097 Then ;green, yellow, red
		$count += 1
	EndIf

	Return $count

EndFunc


Func BattleGIPosCheck($enemy, $offset)

	Switch $enemy
		Case 1
			Local $x = 965
			Local $y = 65
		Case 2
			Local $x = 721
			Local $y = 21
	EndSwitch

	Local $c = _ColorGetRGB(PixelGetColor($x+$offset, $y))

	If $c[0] >= 253 And _
		$c[1] >= 177 And $c[1] <= 188 And _
		$c[2] >=  88 And $c[2] <=  95 Then
		Return True
	EndIf

	Return False

EndFunc


Func BattleGIPosScan($enemy)

	Local $offset = -1

	For $offset = 0 To 140
		If BattleGIPosCheck($enemy, $offset) Then
			Return $offset
		EndIf
	Next

	Return $offset

EndFunc


Func BattleEnemyIsNotALuma($enemy)

	Select
;~ 		Case BattleGIPosCheck($enemy, 12) ;beispiel
		Case Else

			Return False



	EndSelect

	Return True

EndFunc


#endregion

#region Private


Func __BaLuSe_check()

	Static $ts
	If TimerDiff($ts) <= 1000 Then
		Return
	EndIf
	$ts = TimerInit()

	Local $enemyCount = BattleEnemyCount()
	Note("Luma", "Enemy Count: " & $enemyCount)
	If $enemyCount <= 0 Then
		Return
	EndIf

	For $i = $enemyCount To 1 Step -1
		If Not BattleEnemyIsNotALuma($i) Then ;Care: Logical Negated Negation
			Return
		EndIf
	Next

	PopState()
	AddState(Battle_Escape)

EndFunc


;~ Func __BaLuSe_isThereALuma()

;~ 	Local $foes = BattleScan()

;~ 	Note("Log", "Enemy Count: " & $foes[0])

;~ 	For $i = $foes[0] To 1 Step -1

;~ 		Local $x = __genderIconPosSearch($i)
;~ 		Note("Luma", $x)

;~ 		If $x == -1 Or $x >= 72 Then

;~ 			Return True

;~ 		EndIf

;~ 	Next

;~ 	Return False

;~ EndFunc

#endregion
