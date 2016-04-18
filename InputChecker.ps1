$BASEDIR = pwd

If (Test-Path $BASEDIR\input.csv) {
    Write-Output "Loading file `"input.csv`""
    $CSV = Import-Csv "input.csv"
    } Else { 
     Read-Host -Prompt "Script could not find file `"input.csv`"!`nPress ENTER to exit"
     Exit
    }


Write-Output "Checking TitleID for duplicates"
$CSV.TitleID | Group-Object | Where-Object {$_.Count -gt 1}

Write-Output "`nChecking TitleKey for duplicates"
$CSV.TitleKey | Group-Object | Where-Object {$_.Count -gt 1}

Write-Output "`nChecking TitleID and TitleKey for errors"
foreach ($item in $CSV) {
    if ("$($item.TitleID)" -notmatch "^([a-z0-9]{16})$") {
        Write-Output "WARNING: TitleID for $($item.Name) does not match the expected pattern!"
        }
    if ("$($item.TitleKey)" -notmatch "^([a-z0-9]{32})$") {
        Write-Output "WARNING: TitleKey for $($item.Name) does not match the expected pattern!"
        }
}


Read-Host -Prompt "Processing complete!  Review any alerts, then press ENTER to exit"