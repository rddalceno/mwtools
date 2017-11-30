#!/bin/bash
#
# name:        wlssrvstate
# function:    Runs srvstate.wslt under WebLogic Scripting Tool to get
#              a ManagedServer's state
# created:     Nov 29, 2017
# created by:  Ricardo D. Dalceno <ricardo.dalceno@tivit.com.br>
# updated:
# updated by:
#

function wlssrvstate(){
    DOMAIN=$1
    SRVNAME=$2

    $MW_HOME/oracle_common/common/bin/wlst.sh $MWTOOLS_HOME/lib/wlst/srvstate.wlst $DOMAIN $SRVNAME
}
