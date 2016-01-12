#!/bin/bash
ERROR_NOT_CORECT=101
ERROR_ALREADY=100

if [[ $# -ne 2 && $# -ne 3 ]]; then
 echo "Scripts $0 has Error:$ERROR_NOT_CORECT"
 echo "$#"
 exit 1
else
	first=$1
	last=$2
	command=$3
fi

if [ "$command" == D ]; then
	if iptables -D OUTPUT -m iprange --src-range ${first}-${last} -j DROP ; then
	echo "Range ${first}:${last} was deleted"
	exit 0
	fi
fi
printf "First:${first}\n"
printf "second:${last}\n"

if iptables -L OUTPUT -v -n|grep $first > /dev/null ; then
 echo "Firs ip already present in Firewall "
 exit 1
fi
if iptables -L OUTPUT -v -n|grep $last > /dev/null ; then
 echo "Last ip allready present in Firewall"
 exit 1
fi

if iptables -I OUTPUT -m iprange --src-range ${first}-${last} -j DROP ; then
 echo "This range sucseful input for Firewall"
fi
#iptables -L INPUT -v -n
