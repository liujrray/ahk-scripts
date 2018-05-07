SetTimer, a, 10

$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return

a:
  If (GetKeyState("a", "p"))
    Send {a down}{a up}
return

f8::
  Pause
  Suspend
return
