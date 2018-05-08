#Persistent
#SingleInstance, Force

SetTimer, a, 10

a:
  If (GetKeyState("a", "p"))
    Send {a down}{a up}
return

$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return

f8::exitapp