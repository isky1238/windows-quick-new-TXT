Option Explicit
Dim fso, shell, newName, fullPath, currentDir

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' 获取当前运行目录（右键背景触发时通常是该文件夹路径）
currentDir = shell.CurrentDirectory

' 弹出输入框，默认名是 NewFile
newName = InputBox("Enter file name:", "Quick New Text", "NewFile")

' 如果用户没点取消且输入了内容
If newName <> "" Then
    fullPath = currentDir & "\" & newName & ".txt"
    
    If Not fso.FileExists(fullPath) Then
        fso.CreateTextFile(fullPath)
    Else
        MsgBox "Error: File already exists!", 48, "Notice"
    End If
End If