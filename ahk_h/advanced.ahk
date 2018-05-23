#Persistent

toggle := true

script_a := "#If toggle `n $a::`n While GetKeyState(`"a`",`"p`") {`n Send (`"{a down}{a up}`")`n Sleep 10`n }`n return"

script_b := "#If toggle `n $b::`n While GetKeyState(`"b`",`"p`") {`n Send (`"{b down}{b up}`")`n Sleep 10`n }`n return"


thread_a := AhkThread(script_a)
thread_b := AhkThread(script_b)

thread_a.ahkassign("toggle", "1")
thread_b.ahkassign("toggle", "1")


f8::
    If (toggle) {
        thread_a.ahkassign("toggle", "0")
    }
    Else {
        thread_a.ahkassign("toggle", "1")
    }
    toggle := !toggle
Return