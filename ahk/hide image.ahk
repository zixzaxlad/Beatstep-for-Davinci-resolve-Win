#Requires AutoHotkey v2.0

; Define the path for the flag file
CloseFlagFile := "CloseGuiOnceFlag.txt"

; Function to close all AHK GUI windows
CloseAllGui() {
    global CloseFlagFile
    
    ; Check if the flag file exists
    if FileExist(CloseFlagFile) {
        ExitApp  ; Exit silently if the flag file exists
    }

    ; Loop through and close all GUI windows
    Loop Files, "GuiHwnd*.txt" {
        GuiHwnd := FileRead(A_LoopFileFullPath)
        if GuiHwnd {
            try {
                ; Ensure the HWND is correctly formatted for WinClose
                WinClose("ahk_id " GuiHwnd)
                FileDelete(A_LoopFileFullPath)
            } catch {
                MsgBox("Failed to close GUI with HWND " GuiHwnd)
            }
        }
    }

    ; Create the flag file to indicate the script has run
    FileAppend("", CloseFlagFile)
}

CloseAllGui()
