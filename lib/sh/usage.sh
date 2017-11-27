#
#
# name:        usage.sh
# function:    Help function that shows wlutils syntax
# created:     Nov 23, 2017
# created by:  Ricardo D. Dalceno <ricardo.dalceno@tivit.com>
# updated:
# updated by:
#


function usage() {
        echo "Usage: wlutils -d <domain-name> -o <operation>"
        echo
        echo "  Operation must be one of the following options:"
        echo "     dsstate              Returns DataSources state"
        echo "     srvstate             Returns AdminServer and Managed Servers states and health"
	echo "     srvstop              Stops AdminServer or a Managed Server (requires server name)"
	echo "     srvstart             Starts AdminServer or a Managed Server (requires server name)"
	echo "     srvrestart           Stop/Start AdminServer or a Managed Server (requires server name)"
	echo
}

