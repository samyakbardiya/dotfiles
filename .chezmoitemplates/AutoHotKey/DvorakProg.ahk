#Requires AutoHotkey v2.0

#SingleInstance


#SuspendExempt
^!#m:: ToggleLayout()
^+F12:: ReloadScript()
#SuspendExempt False


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


;#############
;# Functions #
;#############

ReloadScript() {
    ToolTip "'DvorakProg' reloaded"
    SetTimer () => ToolTip(), -1000
    Reload
}

SetInputLang(Lang) {
    try {
        hwnd := ControlGetFocus("A")
        PostMessage(0x50, 0, Lang, hwnd)  ; WM_INPUTLANGCHANGEREQUEST
    } catch {
        PostMessage(0x50, 0, Lang, , "A")  ; fallback: whole window
    }
}

ToggleLayout() {
    Suspend
    if A_IsSuspended {
        SetInputLang(0x0409) ; English US
        ToolTip "Qwerty Layout"
    } else {
        SetInputLang(0x4009) ; English IN
        ToolTip "DvorakProg Layout"
    }
    SetTimer () => ToolTip(), -1000
}
