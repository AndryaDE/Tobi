
#include-once
#include <Array.au3>

Global $__taLa_a[0];task schedule
Global $__taLa_b[0];buffer task
Global $__taLa_w = 0;wait untill point

Func TaskScheduler()

	Return __layer_TL

EndFunc

Func __layer_TL()

   If $__taLa_w Then

	  If TimerInit() >= $__taLa_w Then

		 $__taLa_w = 0

	  Else

		 Return True

	  EndIf

   EndIf

   Local $task = _ArrayPop($__taLa_b)
   While IsArray($task)

	  _ArrayAdd($__taLa_a, $task, Default, Default, Default, 1)

	  $task = _ArrayPop($__taLa_b)

   WEnd

   $task = _ArrayPop($__taLa_a)
   If IsArray($task) Then

	  Local $func = $task[0]
	  Local $a = $task[1]

	  ;ConsoleWrite("Task: " & FuncName($func) & " [" & UBound($a) & "] " & _ArrayToString($a) & " (" & $a[1] & ")" & @LF)

	  Switch UBound($a)
	  Case 0
		 $func()
	  Case 1
		 $func($a[0])
	  Case 2
		 $func($a[0], $a[1])
	  Case 3
		 $func($a[0], $a[1], $a[2])
	  Case 4
		 $func($a[0], $a[1], $a[2], $a[3])
	  Case 5
		 $func($a[0], $a[1], $a[2], $a[3], $a[4])
	  Case 6
		 $func($a[0], $a[1], $a[2], $a[3], $a[4], $a[5])
	  Case 7
		 $func($a[0], $a[1], $a[2], $a[3], $a[4], $a[5], $a[6])
	  Case 8
		 $func($a[0], $a[1], $a[2], $a[3], $a[4], $a[5], $a[6], $a[7])
	  Case 9
		 $func($a[0], $a[1], $a[2], $a[3], $a[4], $a[5], $a[6], $a[7], $a[8])
	  EndSwitch

	  Return True ;loop-continue of the Layer Engine

   EndIf

EndFunc

Func Wait($ms = 300)

   $__taLa_w = TimerInit()+10000*$ms

EndFunc

Func Task($func, $a0 = 0, $a1 = 0, $a2 = 0, $a3 = 0, $a4 = 0, $a5 = 0, $a6 = 0, $a7 = 0, $a8 = 0)
   ;ConsoleWrite(@NumParams)

   Local $max = @NumParams-1	;range 0 till 8 elements
   Local $args[$max]


   For $i = $max-1 To 0 Step -1

	  $args[$i] = Eval("a"&$i)

   Next

   Local $task[2] = [$func, $args]
   _ArrayAdd($__taLa_b, $task, Default, Default, Default, 1)

EndFunc
