#include-once


Func BattleScan()

	Local $enemyCount = 0
	Local $enemy1Hp = __battlescan_hpcolor(PixelGetColor(971, 77))
	Local $enemy2Hp = __battlescan_hpcolor(PixelGetColor(728, 43))

	$enemyCount += ($enemy1Hp?1:0) + ($enemy2Hp?1:0)

	Local $ret[3] = [$enemyCount, $enemy1Hp, $enemy2Hp]

	Return $ret

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
