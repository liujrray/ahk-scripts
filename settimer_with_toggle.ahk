SetTimer, a, 10

F7 & a::Toggle_a:=!Toggle_a

#If Toggle_a
$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return
#If

a:
  If (GetKeyState("a", "p") and Toggle_a)
    Send {a down}{a up}
return


f8::
  Pause
  Suspend
return
