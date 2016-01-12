#!/bin/bash
ERROR_NOT_CORECT=101
ERROR_ALREADY=100

if [ $# -ne 2 ]; then
 echo "Scripts $0 has Error:$ERROR_NOT_COREKT"
 exit 1
else
	first=$1
	last=$2
fi

printf "First:${first}\n"
printf "second:${last}\n"

if iptables -L INPUT -v -n|grep $first > /dev/null ; then
 echo "Firs ip already present in Firewall "
 exit 1
fi
if iptables -L INPUT -v -n|grep $last > /dev/null ; then
 echo "Last ip allready present in Firewall"
 exit 1
fi

if iptables -I INPUT -m iprange --src-range ${first}-${last} -j DROP ; then
 echo "This range sucseful input for Firewall"
fi
#iptables -L INPUT -v -n
