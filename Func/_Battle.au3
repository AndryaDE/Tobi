#include-once
#include <Color.au3>


Func BattleScan()

	Local $enemyCount = 0
	Local $enemy1Hp = __battlescan_hpcolor(PixelGetColor(971, 77))
	Local $enemy2Hp = __battlescan_hpcolor(PixelGetColor(728, 43))

	$enemyCount += ($enemy1Hp?1:0) + ($enemy2Hp?1:0)

	Local $ret[3] = [$enemyCount, $enemy1Hp, $enemy2Hp]

	Return $ret

EndFunc

;NUR eine vorrübergehende Funktion bis wir Felddaten von Lumas haben
Func __genderIconPosSearch($enemy = 1)

	Switch $enemy
		Case 1
			Local $x = 965
			Local $y = 65
		Case 2
			Local $x = 721
			Local $y = 21
	EndSwitch

	For $i = 0 To 140
		Local $c = _ColorGetRGB(PixelGetColor($x+$i, $y))
		If $c[0] >= 253 And _
			$c[1] >= 177 And $c[1] <= 188 And _
			$c[2] >=  88 And $c[2] <=  95 Then
			Return $i
		EndIf
	Next

	Return -1

EndFunc



Func __battlescan_hpcolor($color)

	Switch $color

		Case 6788663;green
			Return 3

		Case 12546345;yellow
			Return 2

		Case 11149097;red
			Return 1

		Case Else
			Return 0

	EndSwitch

EndFunc
