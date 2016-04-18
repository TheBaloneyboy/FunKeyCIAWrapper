$BASEDIR = pwd

If (Test-Path $BASEDIR\input.csv) {
    Write-Output "Loading file `"input.csv`""
    $CSV = Import-Csv "input.csv"
    } Else { 
     Read-Host -Prompt "Script could not find file `"input.csv`"!`nPress ENTER to exit"
     Exit
    }


Write-Output "Testing for target folder..."
If(!(Test-Path -Path "$BASEDIR\CIAs")) {
    New-Item -ItemType directory -Path $BASEDIR\CIAs | Out-Null
    Write-Output "Creating directory CIAs"
    } Else {
    Write-Output "Directory already exists"
    }

Write-Output "`nProcessing `"input.csv`"..."
foreach ($item in $CSV) {
    Write-Output "Building CIA for $($item.Name)"
    python FunKeyCIA.py -title $($item.TitleID) -key $($item.TitleKey)
    Rename-Item $BASEDIR\cia\$($item.TitleID)\$($item.TitleID).cia -NewName "$($item.Name).cia"
    Move-Item -Force $BASEDIR\cia\$($item.TitleID)\$($item.Name).cia $BASEDIR\CIAs
    Remove-Item $BASEDIR\cia\$($item.TitleID)
    Remove-Item -Recurse $BASEDIR\raw\$($item.TitleID)
    Write-Output `n
    }

    Read-Host -Prompt "Processing complete!  Press ENTER to exit"