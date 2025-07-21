#Requires AutoHotkey v2.0

#SingleInstance

; ; Locale ID
; Qwerty := 0x9
; DvorakProg := 0x409

;===================;
; Dvorak Programmer ;
;===================;

; Number Row
`::$
1::&
2::[
3::`{
4::}
5::(
6::=
7::*
8::)
9::+
0::]
[::!
]::#
; Shift + Number Row
~::~
+1::%
+2::7
+3::5
+4::3
+5::1
+6::9
+7::0
+8::2
+9::4
+0::6
+[::8
+]::`

; First Row
'::;
=::@
; Shift + First Row
+::^

; Second Row
;LControl::Send("{Esc}")

; Third Row
`;::'
