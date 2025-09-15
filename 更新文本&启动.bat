setlocal enabledelayedexpansion
:check_git
echo ===========
echo 自动更新汉化文本
echo ===========
echo 按任意键继续
pause
git --version > nul 2>&1
if %errorlevel% equ 0 (
    echo Git已安装，正在拉取最新文本...
    git pull https://github.com/DDXDB/MGG-AGT-ZH.git
    echo 等待15秒...
    timeout /t 15 /nobreak > nul
    echo 正在启动游戏...
    start "dmmgameplayer://play/ACL/muv_luv_girlsgardenx_cl/cl/win" 
    exit
) else (
    echo 检测到Git未安装
    echo 此脚本需要Git才能运行
    echo 是否安装Git？(y/n)
    set /p choice=
    if /i "%choice%"=="y" (
        echo 正在安装Git...
        winget install --id Git.Git -e --source winget
        echo 安装完成，正在重新检查...
        goto check_git
    ) else (
        echo 未安装Git，程序退出
        exit
    )
)
