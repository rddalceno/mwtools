#!/bin/bash
#
# name:        killwls
# function:    Kills WebLogic Server
# created:     Aug 10, 2017
# created by:  Ricardo D. Dalceno <ricardo.dalceno@tivit.com.br>
# updated:
# updated by:
#

# Help function
#

function usage() {
    echo "Usage:    killwls <Name>"
    echo
    echo " <Name>:    The Managed Server name"
    echo
}

# Parsing arguments
#

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

# Get Weblogic Server PID..
# Read WebLogic Server as $1
#

function getpid() {
        WLSPID=`ps -ef|grep $1|grep -v grep|grep -v $0| awk '{print $2}'`
        echo $WLSPID
}

# Doing my job...

COUNT=0
while [ "`getpid $1`" != "" ]; do
        if [ $COUNT -gt 3 ]; then
                kill -KILL `getpid $1`
        else
                kill -TERM `getpid $1`
        fi

        let COUNT=$COUNT+1
        sleep 15
done

exit 0
