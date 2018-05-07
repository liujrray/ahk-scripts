SetTimer, a, 10
SetTimer, s, 10
SetTimer, d, 10
SetTimer, f, 10
SetTimer, g, 10
SetTimer, v, 10
SetTimer, q, 10
SetTimer, space, 10
$a::
  Send, {a down}
  KeyWait, a
  Send, {a up}
Return
a:
    If (GetKeyState("a", "p"))
        Send {a up}{a down}
return
$s::
  Send, {s down}
  KeyWait, s
  Send, {s up}
Return
s:
    If (GetKeyState("s", "p"))
        Send {s up}{s down}
return
$d::
  Send, {d down}
  KeyWait, d
  Send, {d up}
Return
d:
    If (GetKeyState("d", "p"))
        Send {d up}{d down}
return
$f::
  Send, {f down}
  KeyWait, f
  Send, {f up}
Return
f:
    If (GetKeyState("f", "p"))
        Send {f up}{f down}
return
$g::
  Send, {g down}
  KeyWait, g
  Send, {g up}
Return
g:
    If (GetKeyState("g", "p"))
        Send {g up}{g down}
return
$v::
  Send, {v down}
  KeyWait, v
  Send, {v up}
Return
v:
    If (GetKeyState("v", "p"))
        Send {v up}{v down}
return
$q::
  Send, {q down}
  KeyWait, q
  Send, {q up}
Return
q:
    If (GetKeyState("q", "p"))
        Send {q up}{q down}
return
$space::
  Send, {space down}
  KeyWait, space
  Send, {space up}
Return
space:
    If (GetKeyState("space", "p"))
        Send {space up}{space down}
return

f8::
  Pause
  Suspend
return
