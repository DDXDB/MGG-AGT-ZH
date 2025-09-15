@echo off
echo ==========================================
echo 自动更新汉化文本
echo ==========================================
echo 按任意键继续
echo ==========================================
pause
setlocal enabledelayedexpansion

:check_git
git --version > nul 2>&1
if %errorlevel% equ 0 (
    echo Git已安装，正在拉取最新代码...
    git pull https://github.com/DDXDB/MGG-AGT-ZH.git
    echo 等待30秒...
    timeout /t 30 /nobreak > nul
    echo 正在启动游戏...
    echo 请耐心等待
    echo 不要手动运行游戏
    timeout /t 10 /nobreak > nul
    start "" dmmgameplayer://play/ACL/muv_luv_girlsgardenx_cl/cl/win
    exit
) else (
    echo ==========================================
    echo 检测到Git未安装
    echo 此脚本需要Git才能运行
    echo 是否安装Git？(y/n)
    echo ==========================================
    set /p choice=
    if /i "%choice%"=="y" (
        echo 正在安装Git...
        winget install --id Git.Git -e --source winget
        echo 安装完成，正在重新检查...
        timeout /t 5 /nobreak > nul
        goto check_git
    ) else (
        echo 未安装Git，程序退出
        exit
    )
)
