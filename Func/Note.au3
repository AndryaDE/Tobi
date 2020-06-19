#include-once
#include <Array.au3>
#include "..\Func\Str.au3"

;~ Listener("Log", ConsoleOutput)

#region Interface


Func Note($key, $value = Null, $default = Null)

	Static $k[0]
	Static $v[0]

	Local $index = _ArraySearch($k, $key)

	If $value == Null Then ;getter

		If $index >= 0 Then

			Return $v[$index]

		Else

			Return $default

		EndIf

	Else ;setter

		If $index >= 0 Then

			$v[$index] = $value

		Else

			_ArrayAdd($k, $key)
			_ArrayAdd($v, $value)

		EndIf

		Listener($key, $value, "call")

	EndIf

EndFunc



Func Listener($key, $payload, $do = "add")

	Static $listener[0]
	Static $callback[0]

	Switch $do

		Case "call" ;payload = data

			Local $i = _ArraySearch($listener, $key)

			If $i == -1 Then
				Return
			EndIf

			$callback[$i]($key, $payload)

		Case Else ;payload = callback function

			_ArrayAdd($listener, $key)
			_ArrayAdd($callback, $payload)

			Note("Log", "Listener " & Str($payload) & " for " & $key & " added")

	EndSwitch

EndFunc


#endregion



#region Misc


Func ConsoleOutput($key, $value)

	ConsoleWrite($value & @LF)

EndFunc


#endregion

