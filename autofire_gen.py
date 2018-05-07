KEYS = ['a', 's', 'd', 'f', 'g', 'v', 'q', 'space']


result = ''
templates = [
'''SetTimer, {0}, 10
''',
'''${0}::
  Send, {{{0} down}}
  KeyWait, {0}
  Send, {{{0} up}}
Return
{0}:
    If (GetKeyState("{0}", "p"))
        Send {{{0} up}}{{{0} down}}
return
'''
]

for template in templates:
    for key in KEYS:
       result += template.format(key)
result += '''
f8::
  Pause
  Suspend
return
'''

with open('my.ahk', 'w+') as f:
    f.write(result)
