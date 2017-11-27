#
#
# name:        chkvars
# function:    Check if environment variables are set correctly
# created:     Nov 23, 2017
# created by:  Ricardo D. Dalceno <ricardo.dalceno@tivit.com>
# updated:
# updated by:
#

function chkvars(){
        if [ "`env|grep $1`" == "" ]; then
                echo "Error: 1"
                echo "You must set $1 before running this program"
                echo
                exit 1
        fi
}

