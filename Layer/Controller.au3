#include-once
#include "..\Func\Note.au3"
#include "..\Func\_ClearKeys.au3"


Global $__CL_Stop = True


#region Layer


Func Controller() ;initator

	Return __layer_CL

EndFunc


Func __layer_CL() ;layer

	Return $__CL_Stop

EndFunc


#endregion



#region Interface


Func CtrlStop()

	$__CL_Stop = True
	_ClearKeys()
	Note("Log", "Control Stop")

EndFunc


Func CtrlStart()

	$__CL_Stop = False
	Note("Log", "Control Start")

EndFunc


Func CtrlExit()

	_ClearKeys()
	Note("Log", "Control Exit")
	Exit

EndFunc


#endregion
