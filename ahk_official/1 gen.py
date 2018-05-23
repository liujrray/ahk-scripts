KEYS = ['x', 'a', 'q', 's', 'd', 'f', 'g', 'v']


result = ''
templates = [
'''SetTimer, {0}, 10
''',
'''Toggle_{0} := true
''',
'''F7 & {0}::Toggle_{0} := !Toggle_{0}
''',
'''#If Toggle_{0}
${0}::
  Send, {{{0} down}}
  KeyWait, {0}
  Send, {{{0} up}}
Return
#If
{0}:
    If (GetKeyState("{0}", "p") and Toggle_{0})
        Send {{{0} down}}{{{0} up}}
return
'''
]

result += '''#Persistent
#SingleInstance, Force
'''
for template in templates:
    for key in KEYS:
       result += template.format(key)
result += '''f8::
  Pause
  Suspend
return
'''

with open('x generated.ahk', 'w+') as f:
    f.write(result)
