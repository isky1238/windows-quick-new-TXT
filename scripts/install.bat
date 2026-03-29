@echo off
setlocal enabledelayedexpansion

echo 正在安装右键菜单项目...
echo.

:: 定位到 scripts 目录
pushd "%~dp0"

:: 获取 VBS 路径
set "VBS_FILE=..\src\NewText.vbs"
for %%i in ("%VBS_FILE%") do set "ABS_PATH=%%~fi"

:: 检查文件是否存在
if not exist "!ABS_PATH!" (
    echo [error] 找不到文件: !ABS_PATH!
    popd
    pause
    exit /b 1
)

:: 写注册表
echo 正在写入注册表...

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\NewText" /ve /d "快速新建文本文档(&X)" /f
if !errorlevel! neq 0 goto :fail

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\NewText" /v "Icon" /d "notepad.exe,0" /f
if !errorlevel! neq 0 goto :fail

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\NewText\command" /ve /d "wscript.exe \"!ABS_PATH!\"" /f
if !errorlevel! neq 0 goto :fail

echo.
echo --------------------------------------------------
echo [Prompt] install successful
echo [Prompt] 快捷键：右键菜单弹出后按 X
echo [Prompt] location: !ABS_PATH!
echo --------------------------------------------------

popd
pause
exit /b 0

:fail
echo.
echo [error] install failed
echo [error] 请右键点击此脚本，选择“以管理员身份运行”
echo.

popd
pause
exit /b 1