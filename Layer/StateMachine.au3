#cs

OFFENSIVE PROGRAMMING NOTE

Fehlermeldung:
$__SM_state()
$__SM_state^ ERROR

Bedeutet, dass kein State geaddet wurde, bevor die StateMachine angeschmissen wurde
Also: AddState !

#ce

#include-once
#include <Array.au3>
#include "..\Func\Note.au3"
#include "..\Func\Str.au3"

Global $__SM_stack[1] = [0]
Global $__SM_state = False



#region Layer


Func StateMachine() ;initator

	Return __layer_SM

EndFunc



Func __layer_SM() ;layer

	$__SM_state()

EndFunc


#endregion



#region Interface


Func AddState($initator, $p2 = Null, $p3 = Null, $p4 = Null, $p5 = Null, $p6 = Null)

	If Not IsFunc($initator) Then
		Local $type = VarGetType($initator)
		Note("Log", "Can't call state initator, as is a " & Str($type))
		Return
	EndIf

	Local $strPar = ""
	Switch @NumParams
		Case 1
			Local $state = $initator()
		Case 2
			Local $state = $initator($p2)
			$strPar = ":" & Str($p2)
		Case 3
			Local $state = $initator($p2, $p3)
			$strPar = ":" & Str($p2) & ":" & Str($p3)
		Case 4
			Local $state = $initator($p2, $p3, $p4)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4)
		Case 5
			Local $state = $initator($p2, $p3, $p4, $p5)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4) & ":" & Str($p5)
		Case 6
			Local $state = $initator($p2, $p3, $p4, $p5, $p6)
			$strPar = ":" & Str($p2) & ":" & Str($p3) & ":" & Str($p4) & ":" & Str($p5) & ":" & Str($p6)
	EndSwitch

	If Not IsFunc($state) Then
		Local $type = VarGetType($state)
		Note("Log", "Can't add state, as is a " & Str($type))
		Return
	EndIf

	_ArrayAdd($__SM_stack, $__SM_state)
	$__SM_stack[0] += 1
	$__SM_state = $state

	Note("Log", "State added [" & $__SM_stack[0] & "]" & Str($initator) & $strPar)

EndFunc



Func PopState()

	Local $state = _ArrayPop($__SM_stack)
	$__SM_state = $state

	Note("Log", "State popped [" & $__SM_stack[0] & "]")
	$__SM_stack[0] -= 1

EndFunc


#endregion

