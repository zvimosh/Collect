#!/bin/bash

LOG_FILE=./log/organize.log
INPUT_TIMEOUT=30


if [ -z $1 ]
then
            if [ ! -f "$LOG_FILE" ]
            then
                    echo -n 'Reverse.sh did not find the log file in the default directory, Please specificy the full path of the collect log file?: '
                    read -t $INPUT_TIMEOUT LOG_FILE
                if [ ! -f "${LOG_FILE}" ]
                then
                        echo "${LOG_FILE} is not a valid file, exiting"
                        exit 1
                fi
            fi
else
    LOG_FILE=$1
fi


#echo "$LOG_FILE_LINES"
#CURRENT_NUMBER=0
while read line
do
    #let CURRENT_NUMBER=CURRENT_NUMBER+1
    # save source and destination file to variables, and remove single quate from the string
    SRC_FILE=`awk '{print $4}' <<<"$line"`
    SRC_FILE=${SRC_FILE//\'/}
    DST_FILE=`awk '{print $2}' <<<"$line"`
    DST_FILE=${DST_FILE//\'/}
    #echo "SRC = $SRC_FILE  : DST = $DST_FILE"
    mv -v "$SRC_FILE" "$DST_FILE"
done < $LOG_FILE
