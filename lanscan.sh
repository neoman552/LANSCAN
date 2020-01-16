#!/bin/bash

usage() {
    echo "Usage: $0 <subnet>"
    echo "Example : $0 192.168.5.0"
    echo "Scan the Class C network subnet"
    exit
}

is_alive_ping()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo Node with IP: $i is up.
}

main() {

subnet=`echo $1 | cut -d. -f1,2,3`
for i in  $subnet.{1..254}
do
is_alive_ping $i & disown
done
}

if [ $# -lt 1 ]; then
    usage
elif [ $# -eq 1 ]; then
    main $1
else
    usage
fi
exit
