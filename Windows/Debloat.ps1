Write-Output "Debloating Windows"

$apps = @(
    @{name = "9NBLGGH42THS" },
    @{name = "Microsoft.YourPhone_8wekyb3d8bbwe" }
);

Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if ([String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Purging: " $app.name
        winget uninstall --accept-source-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already purged)"
    }
}