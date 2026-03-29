@echo off
setlocal enabledelayedexpansion

echo 正在卸载右键菜单项目...
echo.

:: 1. 检查管理员权限
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' (
    echo [error] uninstall failed
    echo [Prompt] 请右键点击此脚本，选择“以管理员身份运行”
    goto :end
)

:: 2. 执行删除操作 (路径必须与 install.bat 一致)
set "REG_KEY=HKEY_CLASSES_ROOT\Directory\Background\shell\NewText"

:: 检查项是否存在，避免误报
reg query "!REG_KEY!" >nul 2>&1
if !errorlevel! neq 0 (
    echo [Prompt] 注册表项不存在，可能已经卸载
    goto :end
)

echo 正在清理注册表残留...
reg delete "!REG_KEY!" /f >nul 2>&1

if !errorlevel! equ 0 (
    echo.
    echo [Prompt] uninstall successful
    echo [Prompt] 右键菜单已恢复
) else (
    echo.
    echo [error] uninstall failed
    echo [error] 卸载过程中发生未知错误，请手动检查注册表
)

:end
echo.
pause
exit /b 0