# Quick New File

Create new files instantly from Windows right-click menu.

## KeyWord
Context Menu Enhancement
Productivity Tool
Quick File Creation
Windows Automation

## ✨ Features
- Create new .txt files in current directory
- Trigger via right-click + keyboard shortcut
- Lightweight (VBScript, no dependencies)
- Fast and minimal workflow

## 📸 Demo
<img width="313" height="149" alt="Snipaste_2026-03-29_15-32-59" src="https://github.com/user-attachments/assets/6f274954-fe68-4ffe-944c-892f8c55d859" />

## Usage
1. Right click in folder
2. Press shortcut key
3. Enter file name

## 🚀 Installation
### Method 1: Auto Install

1. Double-click `scripts/install.reg`
2. Done!

### Method 2: Manual

1. Open Registry Editor
2. Go to:
   HKEY_CLASSES_ROOT\Directory\Background\shell
3. Add new key: NewText
4. Set command to:

   wscript.exe "your_path\NewText.vbs"

## ⌨️ Usage
1. Right-click in any folder
2. Press `X`
3. Enter file name
4. Done!

## ⚠️ Known Issues
- Script must be saved as ANSI or UTF-8 without BOM
- UTF-8 with BOM will cause:
  "Invalid character (800A0408)"
