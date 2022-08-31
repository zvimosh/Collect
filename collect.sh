#!/bin/bash

# set variables
SOURCE_DIRECTORY=$1

EXE_DIRECTORY="~/bin"
LIB_DIRECTORY="~/lib"
SRC_DIRECTORY="~/src"
INCLUDE_DIRECTORY="~/inc"

# check if given a folder as parameter, if not then ask for a folder

#Functions

#function check if folder is valid
function directory_validation()
{
        if [ -d $1 ]
        then
                if [ -$2 $SOURCE_DIRECTORY ]
                then
                        echo "Directory $1 is valid"
                else
                        echo "Directory $1 does not have requsted permissions"
                        return 1
                fi
        else
                echo "Directory $1 is not valid"
                return 1
        fi
        return 0
}
#function to create directory
function make_dirctory () {
        echo "$DIRECTORY did not exist, will create it"
        mkdir $1
}

# function change permissions to a folder
# $1 - to whom to change permissions, valid values are : u/g/o
# $2 - how to change, valid valuses are -/+
# $3 - what permissions to change, valid values are r/w/x/ or any combanitation of them
# $4 - which folder/file to change
function change_permissions()
{
        chmod $1$2$3 $4
}

# function to copy files from one folder to another
copy_files()
{
        echo ''
}

find_files()
{
    find $1 -perm /$2 -name "$3"

}

# MAIN
if [ -z $1 ]
then
                echo -n 'which directory do you want to collect from?: '
                read SOURCE_DIRECTORY
fi

# checks if given folder is valid

directory_validation "$SOURCE_DIRECTORY" "r"
echo -n "Choose a directory for Executable files to be moved default - [$EXE_DIRECTORY]: "
read EXE_DIRECTORY_TEMP
if [ -z $EXE_DIRECTORY_TEMP ]
then
        EXE_DIRECTORY=$EXE_DIRECTORY
else
        EXE_DIRECTORY=$EXE_DIRECTORY_TEMP
fi

find_files "$SOURCE_DIRECTORY" "u+x,o+x,g+x" "*.bin"

#change_permissions "u" "+" "rwx" "$SOURCE_DIRECTORY"
#change_permissions "o" "+" "r" "$SOURCE_DIRECTORY"