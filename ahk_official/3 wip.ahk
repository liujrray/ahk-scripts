#Persistent
#SingleInstance, force

a := new Spammer("a")
F7 & a::a.Toggle()
s := new Spammer("s")
F7 & s::s.Toggle()

F8::
  Pause
  Suspend
return


class Spammer {
  Static interval := 10
  
  __New(key) {
    this.key := key
    this.on := false
    this.timer := ObjBindMethod(this, "Tick")
    this.Toggle()
  }
  
  Start() {
    timer := this.timer
    SetTimer % timer, % Spammer.interval
    key = % this.key
    #If this.on
    Hotkey $%key%, EmptyLabel
  }
  
  Stop() {
    timer := this.timer
    SetTimer % timer, Off
  }
  
  Tick() {
    key = % this.key
    If (GetKeyState(key, "p")) {
      Send {%key% down}{%key% up}
    }
  }
  
  Toggle() {
    if (!this.on) {
      this.Start()
    }
    else {
      this.Stop()
    }
    this.on := !this.on
  }
}

EmptyLabel:
return
