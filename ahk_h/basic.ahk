f8:: toggle := !toggle

#If toggle
$a::
  While GetKeyState("a","p") {
    Send ("{a down}{a up}")
    Sleep 10
  }
return

