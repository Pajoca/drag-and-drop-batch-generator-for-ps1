# ==========�֐���`��[�n]==========
# �^����ꂽpath��PowerShell�X�N���v�g�̋N���p�o�b�`�t�@�C�����o��
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


# �^����ꂽpath�̃t�H���_���ɂ��邻�ꂼ���PowerShell�X�N���v�g�̋N���p�o�b�`�t�@�C�����o��
function Out-BatchesForDistribution($path) {
    Get-ChildItem -LiteralPath $path | ?{ $_.Name -like "*.ps1" } | %{ Out-BatchForDistribution $_.FullName }
}
# ==========�֐���`��[�I]==========



# ==========�X�N���v�g���s�J�n�_==========
if ($args.Length -eq 0) { exit }

# �����ŗ^����ꂽ�t�@�C���p�X���t�H���_���t�@�C�������肵�ʊ֐����Ăяo���B
# �t�@�C���̏ꍇ�͊g���q��.ps1�̏ꍇ�̂ݕʊ֐��Ăяo���B
foreach ($path in $args) {
    if (Test-Path -LiteralPath $path -PathType Container) {
        Out-BatchesForDistribution $path
    } else {
        if ([System.IO.Path]::GetExtension($path) -ne ".ps1") {continue}
        Out-BatchForDistribution $path
    }
}