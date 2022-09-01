#!/bin/bash

# set variables
SOURCE_DIRECTORY=$1

EXE_DIRECTORY="~/bin"
LIB_DIRECTORY="~/lib"
SRC_DIRECTORY="~/src"
INCLUDE_DIRECTORY="~/inc"
INPUT_TIMEOUT=10

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
function make_dirctory()
{
        if [ -d $1 ]
        then
                echo "Directory $1 already exists"
        else
                mkdir $1
                if [ $? -eq 0 ]
                then
                        echo "Directory $1 created"
                else
                        echo "Directory $1 not created"
                        exit 1
                fi
        fi
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

# function to move files from one folder to another
move_files()
{
        mv $SEARCHED_FILES $2
}

find_files()
{
    SEARCHED_FILES=find $1 -perm /$2 -name "$3"
}

# function replace folder
replace_folder()
{
        if [ -z $1 ]
        then
                echo "$2"
        else
                echo "$1"
        fi
}

# MAIN
if [ -z $1 ]
then
                echo -n 'which directory do you want to collect from?: '
                read -t $INPUT_TIMEOUT SOURCE_DIRECTORY
                if [ -z $SOURCE_DIRECTORY ]
                then
                        echo "No directory given, using working directory `pwd`"
                        SOURCE_DIRECTORY = `pwd`
                fi
fi

# checks if given folder is valid
directory_validation "$SOURCE_DIRECTORY" "r"

echo -n "Choose a directory for Executable files to be moved default, press enter to use default or wait 10 seconds - default:[$EXE_DIRECTORY]: "
read -t $INPUT_TIMEOUT EXE_DIRECTORY_TEMP
echo ""
echo "old directory is $EXE_DIRECTORY"
EXE_DIRECTORY=$(replace_folder $EXE_DIRECTORY_TEMP $EXE_DIRECTORY)
echo "new directory is $EXE_DIRECTORY"
make_dirctory $EXE_DIRECTORY
#find_files "$SOURCE_DIRECTORY" "u+x,o+x,g+x" "*.bin"


echo -n "Choose a directory for LIB files to be moved default, press enter to use default or wait 10 seconds - default:[$LIB_DIRECTORY]: "
read -t $INPUT_TIMEOUT LIB_DIRECTORY_TEMP
echo ""
echo "old directory is $LIB_DIRECTORY"
LIB_DIRECTORY=$(replace_folder $LIB_DIRECTORY_TEMP $LIB_DIRECTORY)
make_dirctory $LIB_DIRECTORY


echo -n "Choose a directory for SRC files to be moved default, press enter to use default or wait 10 seconds - default:[$SRC_DIRECTORY]: "
read -t $INPUT_TIMEOUT SRC_DIRECTORY_TEMP
echo ""
echo "old directory is $SRC_DIRECTORY"
SRC_DIRECTORY=$(replace_folder $SRC_DIRECTORY_TEMP $SRC_DIRECTORY)
make_dirctory $SRC_DIRECTORY

echo -n "Choose a directory for INCLUDE files to be moved default, press enter to use default or wait 10 seconds - default:[$INCLUDE_DIRECTORY]: "
read -t $INPUT_TIMEOUT INCLUDE_DIRECTORY_TEMP
echo ""
echo "old directory is $INCLUDE_DIRECTORY"
INCLUDE_DIRECTORY=$(replace_folder $INCLUDE_DIRECTORY_TEMP $INCLUDE_DIRECTORY)
make_dirctory $INCLUDE_DIRECTORY


#change_permissions "u" "+" "rwx" "$SOURCE_DIRECTORY"
#change_permissions "o" "+" "r" "$SOURCE_DIRECTORY"