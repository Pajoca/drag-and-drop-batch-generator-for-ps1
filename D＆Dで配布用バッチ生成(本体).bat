@echo off
pushd %~dp0
powershell -ExecutionPolicy Bypass -File ".\D＆Dで配布用バッチ生成_code.ps1" %*
popd