Write-Output "Installing packages"

$packages = @(
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.VCRedist.2015+.x64",

    "Mozilla.Firefox",

    "7zip.7zip",
    "Zoom.Zoom",
    "Kakao.KakaoTalk",

    "Microsoft.PowerToys",
    "Alacritty.Alacritty",

    "Dell.CommandUpdate"
);
 	
Foreach ($package in $packages) {
    $packageList = winget list --exact -q $package
    if (![String]::Join("", $packageList).Contains($package)) {
        Write-host "Installing: " $package
        winget install --accept-source-agreements --id $package
    }
    else {
        Write-host "Skipping: " $package " (already installed)"
    }
}