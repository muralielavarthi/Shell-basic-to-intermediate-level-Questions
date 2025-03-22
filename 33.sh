#!/bin/bash

echo -n "enter valid directory path:"
read DIR
if [ -d $DIR ]
then
    LOG_FILES=$(find "$DIR" -type f -name "*.log")
    while read LINE # read line by line from file
    do
        if [ -r $LINE ] # to check whether file has read permissions
        then
            grep -i "error" $LINE &>>log-file.txt
            if [ $? -eq 0 ]
            then
                echo $LINE >>output.txt
            fi
        else
            echo "No read permisson $LINE"
        fi  
    done <<< $LOG_FILES   # when you want pass file as input (<<<)
else
    echo "enter valid directory path"

fi

cat output.txt
