# Collect
**_Author: Zvi Moshkovitz_**

**_Last Modified: 31/08/2022_**

**_Modified By: Zvi_**
**_Version: 1.0_**

## Important Notes
1. **This script was developed as part of a Linux course, it is not meant for production!**

## Decription
This script is used to collect files from a given folder and devide them into seperate folders.

## Usage

chmod +x collect.sh
./collect.sh "SOURCE_DIRECTORY"

Example:
./collect.sh "~/Downloads/MyPackage/"

Parameters (Defaults):
SOURCE_DIRECTORY=$1
EXE_DIRECTORY=~/bin
LIB_DIRECTORY=~/lib
SRC_DIRECTORY=~/src
INCLUDE_DIRECTORY=~/inc
LOG_FILE=organize.log
LOG_DIRECTORY=./
INPUT_TIMEOUT=10 #in seconds

A postional paramter $1 is accepted for SOURCE_DIRECTORY, if no positinal paramter is given, the script will read the input for the SOURCE_DIRECTORY
all "DIRECTORY" parameters can be changed during the script runtime.

## Changelog
* 31-08-2022
    * Initial version
* 03-09-2022
    * Finished Script