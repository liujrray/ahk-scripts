#Persistent
#SingleInstance, Force

Toggle_all := true

SetTimer, a, 10

Toggle_a := true
F7 & a::Toggle_a:=!Toggle_a

#If Toggle_a
$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return
#If

a:
  If (GetKeyState("a", "p") and Toggle_all and Toggle_a)
    Send {a down}{a up}
return


f8::
  Suspend
  Toggle_all := !Toggle_all
return
