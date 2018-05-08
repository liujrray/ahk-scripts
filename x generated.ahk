#Persistent
#SingleInstance, Force

Toggle_all := true
SetTimer, x, 10
SetTimer, a, 10
SetTimer, q, 10
SetTimer, s, 10
SetTimer, d, 10
SetTimer, f, 10
SetTimer, g, 10
SetTimer, v, 10
Toggle_x := true
Toggle_a := true
Toggle_q := true
Toggle_s := true
Toggle_d := true
Toggle_f := true
Toggle_g := true
Toggle_v := true
F7 & x::Toggle_x := !Toggle_x
F7 & a::Toggle_a := !Toggle_a
F7 & q::Toggle_q := !Toggle_q
F7 & s::Toggle_s := !Toggle_s
F7 & d::Toggle_d := !Toggle_d
F7 & f::Toggle_f := !Toggle_f
F7 & g::Toggle_g := !Toggle_g
F7 & v::Toggle_v := !Toggle_v
#If Toggle_x
$x::
  Send, {x down}
  KeyWait, x
  Send, {x up}
Return
#If
x:
    If (GetKeyState("x", "p") and Toggle_x and Toggle_all)
        Send {x down}{x up}
return
#If Toggle_a
$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return
#If
a:
    If (GetKeyState("a", "p") and Toggle_a and Toggle_all)
        Send {a down}{a up}
return
#If Toggle_q
$q::
  Send, {q down}
  KeyWait, q
  Send, {q up}
Return
#If
q:
    If (GetKeyState("q", "p") and Toggle_q and Toggle_all)
        Send {q down}{q up}
return
#If Toggle_s
$s::
  Send, {s down}
  KeyWait, s
  Send, {s up}
Return
#If
s:
    If (GetKeyState("s", "p") and Toggle_s and Toggle_all)
        Send {s down}{s up}
return
#If Toggle_d
$d::
  Send, {d down}
  KeyWait, d
  Send, {d up}
Return
#If
d:
    If (GetKeyState("d", "p") and Toggle_d and Toggle_all)
        Send {d down}{d up}
return
#If Toggle_f
$f::
  Send, {f down}
  KeyWait, f
  Send, {f up}
Return
#If
f:
    If (GetKeyState("f", "p") and Toggle_f and Toggle_all)
        Send {f down}{f up}
return
#If Toggle_g
$g::
  Send, {g down}
  KeyWait, g
  Send, {g up}
Return
#If
g:
    If (GetKeyState("g", "p") and Toggle_g and Toggle_all)
        Send {g down}{g up}
return
#If Toggle_v
$v::
  Send, {v down}
  KeyWait, v
  Send, {v up}
Return
#If
v:
    If (GetKeyState("v", "p") and Toggle_v and Toggle_all)
        Send {v down}{v up}
return
f8::
  Suspend
  Toggle_all := !Toggle_all
return
