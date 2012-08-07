#!/bin/sh

USERID=$1
PASSWORD=$2

function usage(){
    echo "Usage:"
    echo "$0 UserID Password"
    exit 0
}

if [ $# -ne 2 ]
then
    useradd -d /dev/null -g smbusers -s /sbin/nologin $USERID
    echo -e "$PASSWORD\n$PASSWORD\n" | pdbedit -t -a -u $USERID
    echo "Success!"
    echo "UserID = $USERID"
    echo "Password = $PASSWORD"
    
else
    usage
fi

