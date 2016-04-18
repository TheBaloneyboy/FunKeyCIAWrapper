# FunKeyCIAWrapper
*A simple wrapper for cearp's FunKeyCIA python script*

### About
This is a simple little script I put together to automate the process of downloading CIAs via Cearp's FunKeyCIA script.  It's in PowerShell because it started out life as a batch script, but that wasn't powerful enough to do everything I wanted.  I've decided to go ahead and share it in the hopes that others will find it useful - if I find that it's popular enough, I'll probably make a Linux equivalent, or even port the whole thing to a more OS-agnostic language.

### Prerequisites
This script requires Cearp's [FunKeyCIA](https://gbatemp.net/threads/release-funkeycia-make-good-cias-from-eshop-content-no-tickets-needed.423025/) to be fully  functional.
If you can run `python FunKeyCIA.py -title <titleID here> -key <titleKey here>` then you're ready to go.

### The Files
This project consists of two files: InputChecker.ps1 and FunKeyCIAWrapper.psi
Both files require a .csv file named 'input.csv' to be present in the same directory in which they are run.

**InputChecker.ps1**

Checks 'input.csv' for a few basic errors:
* Checks to make sure there aren't any duplicate TitleIDs or TitleKeys
* Uses Regex to check the TitleID and TitleKey fields to make sure they match a few expected parameters (you didn't slip a comma or a space in on accident)

**FunKeyCIAWrapper.ps1**

Iterates through 'input.csv', using FunKeyCIA to make CIAs from the paired TitleID and encrypted TitleKey.
It then renames the CIA from the TitleID to a user-specified name, relocates it into a central directory, then cleans up after FunKeyCIA.

**input.csv**

A template file.  Order is TitleIDs, TitleKeys, User-Friendly Name.  Make sure there are no spaces between the various fields and the commas. Ex:
`123412341234,a123b123c123d123e123f123g123h123,Sample Super Awesome Game`

### How to Use
* Place both PowerShell script files, along with your 'input.csv' file in the same directory as FunKeyCIA.py
* (Optional) Right-click InputChecker.ps1 and select "Run with PowerShell".  Remove duplicates or correct any title errors the script finds.
* Right-click FunKeyCIAWrapper.ps1 and select "Run with PowerShell".  Wait for the script to run.  Depending on your internet speed, this can take hours.

Once everything finishes, you'll have a folder named CIAs with all of your downloaded games.

### Changelog
0.1.0
* Initial release.  It checks for some basic mistakes in the input.csv file, then automates FunKeyCIA.py
