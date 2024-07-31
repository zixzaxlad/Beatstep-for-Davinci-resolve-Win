#Requires AutoHotkey v2.0

; Define the path for the flag file
DisplayFlagFile := "DisplayGuiOnceFlag.txt"

; Function to load and display an image
LoadImage(ImagePath, HwndFile) {
    global MyGui, MyPic, DisplayFlagFile
    
    ; Check if the flag file exists
    if FileExist(DisplayFlagFile) {
        ExitApp  ; Exit silently if the flag file exists
    }

    if !FileExist(ImagePath) {
        MsgBox("Error: The specified image file does not exist.")
        return
    }

    MyGui := Gui("+Resize")  ; Create a resizable GUI window
    MyPic := MyGui.AddPicture("xm", ImagePath)
    MyGui.Show("AutoSize Center")

    ; Save the GUI's HWND to a file
    FileAppend(MyGui.Hwnd "`n", HwndFile)

    ; Create the flag file to indicate the script has run
    FileAppend("", DisplayFlagFile)
}

; Specify the image path and HWND file name here
InitialImagePath := "C:\Users\ospro\OneDrive\Github\Beatstep-for-Davinci-resolve-Win\overlay\page selection.jpg"  ; Change this path for different images
HwndFile := "GuiHwnd1.txt"  ; Change this file name for different images
LoadImage(InitialImagePath, HwndFile)
