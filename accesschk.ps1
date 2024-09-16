# Set the URL to download AccessChk.zip
$url = "https://download.sysinternals.com/files/AccessChk.zip"

# Set the path for the download location
$tempPath = "$env:TEMP\AccessChk.zip"

# Set the extraction directory (C:\Program Files (x86)\AccessChk)
$extractPath = "C:\Program Files (x86)\AccessChk"

# Download the ZIP file to the temporary folder
Invoke-WebRequest -Uri $url -OutFile $tempPath

# Create the destination folder if it doesn't exist
if (-Not (Test-Path -Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath
}

# Extract the ZIP file to the desired location (C:\Program Files (x86)\AccessChk)
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($tempPath, $extractPath)

# Clean up the downloaded ZIP file from the temporary folder
Remove-Item $tempPath

# Output the result
Write-Host "AccessChk files extracted to $extractPath"
