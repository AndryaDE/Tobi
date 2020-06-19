#include-once
#include <Array.au3>
#include "..\Func\Note.au3"
#include "..\Func\Str.au3"

Global $__LE_stack[1] = [0]

Func LayerEngine()

	Local $m = $__LE_stack[0]

	For $i = 1 To $m
		If $__LE_stack[$i]() Then
			Return
		EndIf
	Next

EndFunc

Func AddLayer($initator, $p2 = Null, $p3 = Null, $p4 = Null, $p5 = Null, $p6 = Null)

	If Not IsFunc($initator) Then
		Local $type = VarGetType($initator)
		Note("Log", "Can't call layer initator, as is a " & Str($type))
		Return
	EndIf

	Local $strPar = ""
	Switch @NumParams
		Case 1
			Local $layer = $initator()
		Case 2
			Local $layer = $initator($p2)
			$strPar = ":" & Str($p2)
		Case 3
			Local $layer = $initator($p2, $p3)
			$strPar = ":" & Str($p2) & ":" & Str($p3)
		Case 4
			Local $layer = $initator($p2, $p3, $p4)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4)
		Case 5
			Local $layer = $initator($p2, $p3, $p4, $p5)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4) & ":" & Str($p5)
		Case 6
			Local $layer = $initator($p2, $p3, $p4, $p5, $p6)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4) & ":" & Str($p5) & ":" & Str($p6)
	EndSwitch

	If Not IsFunc($layer) Then
		Local $type = VarGetType($layer)
		Note("Log", "Can't add layer, as is a " & Str($type))
		Return
	EndIf

	_ArrayAdd($__LE_stack, $layer)
	$__LE_stack[0] += 1

	Note("Log", "Layer added [" & $__LE_stack[0] & "]" & Str($initator) & $strPar)

EndFunc


Func PopLayer()

   Local $layer = _ArrayPop($__LE_stack)
	Note("Log", "Layer popped [" & $__LE_stack[0] & "]")
   $__LE_stack[0] -= 1

EndFunc