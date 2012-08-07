#!/bin/sh

USERID=$1
PASSWORD=$2

function usage(){
    echo "Usage:"
    echo "$0 UserID Password"
    exit 0
}

if [ $# -eq 2 ]
then
    useradd -d /dev/null -g smbusers -s /sbin/nologin $USERID
    if [ $? -eq 0 ]
    then
        echo -e "$PASSWORD\n$PASSWORD\n" | pdbedit -t -a -u $USERID
        echo "Success!"
        echo "UserID = $USERID"
        echo "Password = $PASSWORD"
    else
            echo "useradd Err !"
            exit 1
    fi
else
    usage
fi

