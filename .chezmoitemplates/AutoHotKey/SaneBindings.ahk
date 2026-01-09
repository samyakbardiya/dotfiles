#Requires AutoHotkey v2.0

#SingleInstance

; Reload
+F12:: Reload

; Window Management
!m:: WinMinimize 'A'
+!m:: WinMaximize 'A'

; Application Management
^!u:: ActivateOrRunProgram("wezterm-gui.exe", "C:\Users\samyak.bardiya\Documents\WezTerm-windows-20240203-110809-5046fc22\wezterm-gui.exe")
^!e:: ActivateOrRunProgram("zen.exe")
^!o:: ActivateOrRunProgram("slack.exe", "C:\Users\samyak.bardiya\AppData\Local\slack\slack.exe")
^!a:: ActivateOrRunProgram("")
^!p:: ActivateOrRunProgram("msrdc.exe", '"C:\Program Files\WSL\wslg.exe" -d archlinux --cd "~" -- gnome-terminal')
^!.:: ActivateOrRunProgram("chrome.exe", "C:\Users\samyak.bardiya\AppData\Local\imput\Helium\Application\chrome.exe") ;"
^!,:: ActivateOrRunProgram("outlook.exe")
^!;:: ActivateOrRunProgram("")

;-----------;
; Functions ;
;-----------;

ActivateOrRunProgram(programName, exePath := "") {
    if (!programName) {
        return
    }

    local winTarget := "ahk_exe " . programName
    if (WinExist(winTarget)) {
        WinActivate(winTarget)
        WinMaximize(winTarget)
    } else {
        try {
            Run(exePath ? exePath : programName,, "Open")
        } catch as err {
            MsgBox("Failed to launch '" . programName . "'`n" . err.What)
        }
    }
}

ListOpenPrograms() {
    local output := ""
    allWindows := WinGetList(, , "Program Manager")

    loop allWindows.Length {
        local procName := WinGetProcessName(allWindows[A_Index])
        if (procName) {
            output .= procName . "`n"
        }
    }

    MsgBox(output ? output : "No programs found`n" . allWindows )
}

; RAlt Modifiers
; >!h:: SendInput "{Left}"
; >!j::Down
; >!k::Up
; >!l:: SendInput "{Right}"
; >!b::Home
; >!w::End
; >!u::PgUp
; >!d::PgDn
;
; ; RCtrl Modifiers
; >^Left::Home
; >^Down::PgDn
; >^Up::PgUp
; >^Right::End

;--------------------;
; Desktop Management ;
;--------------------;

; ; Globals
; DesktopCount := 2 ; Windows starts with 2 desktops at boot
; CurrentDesktop := 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)
; ;
; ; This function examines the registry to build an accurate list of the current virtual desktops and which one we're currently on.
; ; Current desktop UUID appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops
; ; List of desktops appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops
; ;
; mapDesktopsFromRegistry() {
;     global CurrentDesktop, DesktopCount
;     ; Get the current desktop UUID. Length should be 32 always, but there's no guarantee this couldn't change in a later Windows release so we check.
;     IdLength := 32
;     SessionId := getSessionId()
;     if (SessionId) {
;         RegRead(CurrentDesktopId,
;             'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops',
;             CurrentVirtualDesktop)
;         if (CurrentDesktopId) {
;             IdLength := StrLen(CurrentDesktopId)
;         }
;     }
;     ; Get a list of the UUIDs for all virtual desktops on the system
;     RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops,
;         VirtualDesktopIDs
;     if (DesktopList) {
;         DesktopListLength := StrLen(DesktopList)
;         ; Figure out how many virtual desktops there are
;         DesktopCount := DesktopListLength / IdLength
;     }
;     else {
;         DesktopCount := 1
;     }
;     ; Parse the REG_DATA string that stores the array of UUID's for virtual desktops in the registry.
;     i := 0
;     while (CurrentDesktopId and i < DesktopCount) {
;         StartPos := (i * IdLength) + 1
;         DesktopIter := SubStr(DesktopList, StartPos, IdLength)
;         OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
;         ; Break out if we find a match in the list. If we didn't find anything, keep the
;         ; old guess and pray we're still correct :-D.
;         if (DesktopIter = CurrentDesktopId) {
;             CurrentDesktop := i + 1
;             OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
;             break
;         }
;         i++
;     }
; }
; ;
; ; This functions finds out ID of current session.
; ;
; getSessionId() {
;     ProcessId := DllCall("GetCurrentProcessId", "UInt")
;     if ErrorLevel {
;         OutputDebug, Error getting current process id: %ErrorLevel%
;         return
;     }
;     OutputDebug, Current Process Id: %ProcessId%
;     DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
;     if ErrorLevel {
;         OutputDebug, Error getting session id: %ErrorLevel%
;         return
;     }
;     OutputDebug, Current Session Id: %SessionId%
;     return SessionId
; }
; ;
; ; This function switches to the desktop number provided.
; ;
; switchDesktopByNumber(targetDesktop) {
;     global CurrentDesktop, DesktopCount
;     ; Re-generate the list of desktops and where we fit in that. We do this because
;     ; the user may have switched desktops via some other means than the script.
;     mapDesktopsFromRegistry()
;     ; Don't attempt to switch to an invalid desktop
;     if (targetDesktop > DesktopCount || targetDesktop < 1) {
;         OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
;         return
;     }
;     ; Go right until we reach the desktop we want
;     while (CurrentDesktop < targetDesktop) {
;         Send ^ #{Right}
;         CurrentDesktop++
;         OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
;     }
;     ; Go left until we reach the desktop we want
;     while (CurrentDesktop > targetDesktop) {
;         Send ^ #{Left}
;         CurrentDesktop--
;         OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
;     }
; }
; ;
; ; This function creates a new virtual desktop and switches to it
; ;
; createVirtualDesktop() {
;     global CurrentDesktop, DesktopCount
;     Send, #^d
;     DesktopCount++
;     CurrentDesktop = %DesktopCount%
;     OutputDebug, [create] desktops: %DesktopCount% current: %CurrentDesktop%
; }
; ;
; ; This function deletes the current virtual desktop
; ;
; deleteVirtualDesktop() {
;     global CurrentDesktop, DesktopCount
;     Send, #^{F4}
;     DesktopCount--
;     CurrentDesktop--
;     OutputDebug, [delete] desktops: %DesktopCount% current: %CurrentDesktop%
; }
