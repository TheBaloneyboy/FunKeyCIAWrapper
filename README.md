# FunKeyCIAWrapper
*A simple wrapper for cearp's FunKeyCIA python script in Python*

### About
This script is based on the script created by [EyelaserNinjaPirate.](https://github.com/EyelaserNinjaPirate/FunKeyCIAWrapper) It is written in Python, making it OS-agnostic.

### Prerequisites
This script requires Cearp's [FunKeyCIA](https://gbatemp.net/threads/release-funkeycia-make-good-cias-from-eshop-content-no-tickets-needed.423025/) to be fully  functional.
If you can run `python FunKeyCIA.py -title <titleID here> -key <titleKey here>` then you're ready to go.

### The Files
This project consists of one file: FunKeyCIAWrapper.py
This file requires an 'input.csv' file to be passed to it.


**FunKeyCIAWrapper.py**

Iterates through 'input.csv', using FunKeyCIA to make CIAs from the paired TitleID and encrypted TitleKey.
It then renames the CIA from the TitleID to a user-specified name, relocates it into a central directory, then cleans up after FunKeyCIA.

**input.csv**

A template file.  Order is TitleIDs, TitleKeys, User-Friendly Name.  Make sure there are no spaces between the various fields and the commas.

Ex: `123412341234,a123b123c123d123e123f123g123h123,Sample Super Awesome Game`

### How to Use
* Place 'FunKeyCIAWrapper.py', along with your 'input.csv' file in the same directory as FunKeyCIA.py
* Go to your command line of choice and type in 'python FunKeyCIAWrapper.py -titles path/to/input.csv'. Wait for the script to run.  Depending on your internet speed, this can take hours.

Once everything finishes, you'll have a folder named CIAs with all of your downloaded games.
