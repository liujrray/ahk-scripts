#Persistent
#SingleInstance force

toggle := true

keys := ["xaq"]

script_template := "#NoTrayIcon `n #If toggle `n $%key%::`n While GetKeyState(`"%key%`",`"p`") {`n Send (`"{%key% down}{%key% up}`")`n Sleep 10`n }`n return"

threads := Object()

For (i, key in keys) {
    script := StrReplace(script_template, "%key%", key)
    thread := AhkThread(script)
    threads.push(thread)
}

For (i, thread in threads) {
    thread.ahkassign("toggle", "1")
}

f8::
    If (toggle) {
        For (i, thread in threads) {
            thread.ahkassign("toggle", "0")
        }
    }
    Else {
        For (i, thread in threads) {
            thread.ahkassign("toggle", "1")
        }
    }
    toggle := !toggle
Return