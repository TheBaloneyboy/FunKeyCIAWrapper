# FunKeyCIAWrapper
# Version: 0.1.0
# Author: EyelaserNinjaPirate
# Description: A simple wrapper for cearp's FunKeyCIA python script

This project consists of two files: InputChecker.ps1 and FunKeyCIAWrapper.psi
Both files require a .csv file named 'input.csv' to be present in the same directory in which they are run.

#InputChecker.ps1
Checks 'input.csv' for a few basic errors:
* Checks to make sure there aren't any duplicate TitleIDs or TitleKeys
* Uses Regex to check the TitleID and TitleKey fields to make sure they match a few expected parameters (you didn't slip a comma or a space in on accident)

#FunKeyCIAWrapper.ps1
Iterates through 'input.csv', using FunKeyCIA to make CIAs using the paired TitleID and encrypted TitleKey.
It then renames the CIA from the TitleID to a user-specified name, relocates it into a central directory, then cleans up after FunKeyCIA.
