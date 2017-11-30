#!/bin/bash
#
# name:        wlutils.sh
# function:    Starts wlutils - WebLogic WLST Utilities
# created:     Nov 23, 2017
# created by:  Ricardo D. Dalceno <ricardo.dalceno@tivit.com>
# updated:
# updated by:
#

#
# Error codes
#
# 1:    Environment variable not set
# 2:    Syntax error
# 3:    Config file not found
# 4:    Domain not found in config file
# 5:    Domain home not found or not readable
# 6:    AdminServer connection refused (maybe down ?)
#

#
# Check if we have everything needed to start
#

if [ "$MWTOOLS_HOME" == "" ]; then
    echo "Please set MWTOOLS_HOME environment variable"
    echo "For more information, please read share/doc/INSTALL"
    echo
    exit 1
fi

#
# Load some libs
#

. $MWTOOLS_HOME/lib/sh/wlschkvars.sh
. $MWTOOLS_HOME/lib/sh/wlsusage.sh

#
# Check if environment variables needed to work were set
#

chkvars MW_HOME

#
# Checks if we have enough parameters
#

if [ $# -lt 1 ]; then
        echo 
	echo "Error 2: Syntax error"
        usage
        exit 2
fi

#
# Parsing parameters
#

while [ $# -gt 0 ]; do
    case $1 in
	-d|--domain)
	    DOMAIN=$2
	    shift
	    ;;

	-o|--operation)
	    OPS=$2
	    case $OPS in
		srv*)
		    SRVNAME=$3
		    shift
		    ;;
	    esac
	    shift
	    ;;

	-h|--help)
	    echo
	    usage
	    exit 0
	    ;;

	*)
	    echo
	    echo "Error 2: Syntax error"
	    usage
	    exit 2
	    ;;
    esac

    shift

done

case $OPS in
    srvstart)
	echo ". $MWTOOLS_HOME/lib/sh/wl_srvstart.sh $DOMAIN $SRVNAME"
	$MW_HOME/oracle_common/common/bin/wlst.sh $MWTOOLS_HOME/lib/wlst/srvstart.wlst $DOMAIN $SRVNAME
	;;

    srvstop)
	echo ". $MWTOOLS_HOME/lib/sh/wl_srvstop.sh $DOMAIN $SRVNAME"
	$MW_HOME/oracle_common/common/bin/wlst.sh $MWTOOLS_HOME/lib/wlst/srvstop.wlst $DOMAIN $SRVNAME
	;;

    srvrestart|srvreload)
	echo ". $MWTOOLS_HOME/lib/sh/wl_srvstop.sh $DOMAIN $SRVNAME"
	sleep 5
	echo ". $MWTOOLS_HOME/lib/sh/wl_srvstart.sh $DOMAIN $SRVNAME"
	;;

    srvstate)
	echo ". $MWTOOLS_HOME/lib/sh/wlsstate.sh $DOMAIN $SRVNAME"
	;;

    dsstats)
	echo "$MW_HOME/oracle_common/common/bin/wlst.sh $MWTOOLS_HOME/lib/wlst/dsstats.wlst weblogic d9a24661da t3://localhost:7001"
	echo
	;;

    dstop)
	$MW_HOME/oracle_common/common/bin/wlst.sh $MWTOOLS_HOME/lib/wlst/dstop.wlst weblogic d9a24661da t3://localhost:7001
	;;

    *)
	echo "Error 2: Syntax error"
	usage
	echo
	exit 2
	;;
esac
