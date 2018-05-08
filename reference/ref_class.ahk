; My spams
new spam("$a",["{a down}", "Sleep 100", "{a up}"])

        
; Turn on/off all hotkeys.
F7::spam.turnOffHotkeysForAll()
F8::spam.turnOnHotkeysForAll()


class spam {
    ; Input:
    ;   - Hotkey, any valid ahk key name. 
    ;   - seq, an array with either keys to send, a func("functionName") to call, or time to: sleep t, or random sleep time: rand t1 t2 
    static all:=[]
    __new(hotkey,seq,before:="",after:=""){
        this.seq:=seq
        this.hotkey:=hotkey
        this.before:=before
        this.after:=after
        this.timerFn:=ObjBindMethod(this,"do")
        this.bindkey("on",3)
        spam.all.push(this)
    }
    
    turnOffHotkeysForAll(){
        for k, s in spam.all {
            if !s.stopped
                s.stop(1)
            s.turnOffHotkeys()
        }
    }
    turnOnHotkeysForAll(){
        for k, s in spam.all
            s.turnOnHotkeys()
    }
    turnOffHotkeys(){
        this.bindKey("off",3)
        this.bindKey("off",1,1)
        return
    }
    turnOnHotkeys(){
        this.bindKey("on",3)
        return
    }
    bindkey(state,n,fn:=""){
        ; Handle hotkeys
        if (n&1) {
            onFn:=ObjBindMethod(this,!fn?"start":"doNothing")
            Hotkey, % this.hotkey, % onFn, % state . " useerrorlevel"
        }
        if (n&2) {
            offFn:=ObjBindMethod(this,"stop")
            Hotkey, % (InStr(this.hotkey,"*")?"":"*") . this.hotkey . " up", % offFn, % state . " useerrorlevel"
        }
        return
    }

    doNothing(){    ; For suppressing autorepeat.
        return
    }
    start(){    ; Start sequence
        this.stopped:=0
        this.do(this.before)
        this.bindkey("off",1)                       ; Turn off the on key
        this.bindkey("on",1,1)                      ; suppress autorepeat
        
        
        this.ind:=1
        
        tf:=this.timerFn
        SetTimer, % tf, -0
        return
    }
    
    stop(stopAll:=""){  ; Stop the sequence
        
        tf:=this.timerFn
        SetTimer, % tf, off
        this.bindkey("off",1,1)                     ; Stop suppress autorepeat
        if !stopAll
            this.do(this.after)
        this.stopped:=1
        this.bindkey("on",1)                        ; Turn on the on key
    }
    
    do(action:=""){ ; Perform the next sequence in the sequence array.
        if this.stopped
            return
        if !action
            action:=this.seq[this.ind]
        else
            noTimer:=true
        ; This block determines the time for settimer, and perform either send or call action.
        if InStr(action,"sleep") {
            t:=RegExReplace(action,".*?(\d+)","$1")
        } else if InStr(action,"rand"){
            RegExMatch(action,"O)(\d+)\s+(\d+)",t)
            t:=this.rand(t[1],t[2])
        } else if IsObject(action) {
            action.call()
            t:=0
        } else {
            Send, % action
            t:=0
        }
        if noTimer
            return
        this.ind++  ; incremenet index
        if (this.ind>this.seq.length())
            this.ind:=1 ; wrap index
        tf:=this.timerFn
        SetTimer, % tf, % "-" t
    }
    
    rand(t1,t2){    ; For random "sleep" time
        random,rnd,t1,t2
        return rnd
    }
    
}
esc::exitapp
