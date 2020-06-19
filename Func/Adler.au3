#include-once
#include <Color.au3>
#include <Array.au3>


Func Adler($pixelset, $hwnd = Default)


	For $i = UBound($pixelset) - 1 To 0 Step -1

		Local $a = $pixelset[$i]
		Local $c = _ColorGetRGB (PixelGetColor($a[0], $a[1]))

		If ($c[0] <= $a[2] + $a[5] And $c[0] >= $a[2] - $a[5]) _
		And($c[1] <= $a[3] + $a[6] And $c[1] >= $a[3] - $a[6]) _
		And($c[2] <= $a[4] + $a[7] And $c[2] >= $a[4] - $a[7]) Then

			ContinueLoop

		Else

			Return False

		EndIf

	Next


	Return True


EndFunc

