#include-once
#include <Array.au3>

Func Str($var)

	Select

		Case IsArray($var)
			Return _ArrayToString($var)

		Case IsFunc($var)
			Return FuncName($var)

		Case Else
			Return String($var)

	EndSelect

EndFunc