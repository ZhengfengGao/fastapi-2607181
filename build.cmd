@echo off
REM 构建脚本 - 安装 Python 依赖到 site-packages 目录

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 使用 uv 安装依赖
uv pip install --index-url=https://mirrors.ivolces.com/pypi/simple ^
    --extra-index-url=https://pypi.org/simple ^
    -r requirements.txt --target .\site-packages
