while($true) {
    Clear-Host
    $dateTime = Get-Date
    echo ("Ctrl+Cキーで終了できます`n" + "$dateTime")
    Start-Sleep -Seconds 1
}