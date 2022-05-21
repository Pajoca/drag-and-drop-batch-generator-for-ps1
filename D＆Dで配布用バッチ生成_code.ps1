# ==========関数定義部[始]==========
# 与えられたpathのPowerShellスクリプトの起動用バッチファイルを出力
function Out-BatchForDistribution($path) {
$psFileName = [System.IO.Path]::GetFileName($path)

$batchText = @"
@echo off
pushd %~dp0
powershell -ExecutionPolicy Bypass -File ".\$($psFileName)" %*
popd
"@

$batchFilePath = (Join-Path (Split-Path $path -Parent) ([System.IO.Path]::GetFileNameWithoutExtension($path))) + ".bat"
Set-Content -LiteralPath $batchFilePath -Value $batchText -Encoding Default
}


# 与えられたpathのフォルダ内にあるそれぞれのPowerShellスクリプトの起動用バッチファイルを出力
function Out-BatchesForDistribution($path) {
    Get-ChildItem -LiteralPath $path | ?{ $_.Name -like "*.ps1" } | %{ Out-BatchForDistribution $_.FullName }
}
# ==========関数定義部[終]==========



# ==========スクリプト実行開始点==========
if ($args.Length -eq 0) { exit }

# 引数で与えられたファイルパスがフォルダかファイルか判定し別関数を呼び出し。
# ファイルの場合は拡張子が.ps1の場合のみ別関数呼び出し。
foreach ($path in $args) {
    if (Test-Path -LiteralPath $path -PathType Container) {
        Out-BatchesForDistribution $path
    } else {
        if ([System.IO.Path]::GetExtension($path) -ne ".ps1") {continue}
        Out-BatchForDistribution $path
    }
}