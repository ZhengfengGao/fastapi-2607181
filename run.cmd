@echo off
REM 运行脚本 - 启动 FastAPI 服务

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 自动激活本地虚拟环境（如果存在）
if exist ".venv\Scripts\activate.bat" (
    call .venv\Scripts\activate.bat
)

python main.py
