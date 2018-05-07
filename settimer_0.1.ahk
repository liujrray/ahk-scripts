SetTimer, a, 1000
$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return
a:
    If (GetKeyState("a", "p"))
        Send {a up}{a down}
return
f8::
  Pause
  Suspend
return