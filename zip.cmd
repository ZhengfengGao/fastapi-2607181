@echo off
REM 打包脚本 - 创建部署用的 zip 文件

REM 切换到脚本所在目录
cd /d "%~dp0"

set ZIP_NAME=vefaas-native-python3.12-fastapi-default.zip

REM 删除已存在的 zip 文件
if exist "%ZIP_NAME%" del /f "%ZIP_NAME%"

REM 使用 PowerShell 创建 zip 文件（排除指定目录）
powershell -Command ^
    "$excludeDirs = @('site-packages', '.venv', '.wheels', '__pycache__', '.git'); ^
    $files = Get-ChildItem -Path '.' -Recurse -File | Where-Object { ^
        $path = $_.FullName; ^
        $exclude = $false; ^
        foreach ($dir in $excludeDirs) { ^
            if ($path -match [regex]::Escape($dir)) { $exclude = $true; break } ^
        }; ^
        -not $exclude -and $_.Name -ne '.DS_Store' ^
    }; ^
    Compress-Archive -Path $files.FullName -DestinationPath '%ZIP_NAME%' -Force"

echo 打包完成: %ZIP_NAME%
