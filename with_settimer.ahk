$a::SetTimer, a, % (Toggle_a := !Toggle_a) ? 250 : "Off"
$b::SetTimer, b, % (Toggle_b := !Toggle_b) ? 250 : "Off"
$c::SetTimer, c, % (Toggle_c := !Toggle_c) ? 250 : "Off"

a:
b:
c:
Send, %A_ThisLabel%
return