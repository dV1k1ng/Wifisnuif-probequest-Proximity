#!/bin/bash
#
MAC1 = [your laptop MAC here]
MAC2 = [your mobile MAC here]

sleep 20
int=`sudo airmon-ng | grep 8187 | cut -d $'\t' -f2`
monitor=${int}mon
if test -z "$monitor"
then
	sleep 60
	reboot
fi

# start monitor-mode interface
sudo airmon-ng start ${int}

# start channel-hopping monitor interface
sudo airodump-ng ${monitor} &

# start proberequest sniffer
sleep 20
datum=`date +"%Y-%m-%d"`
outfile="/opt/WifiSnuif/out/"${datum}".csv"

sudo probequest -i ${monitor} -o ${outfile} --threshold -50 --alert_macs /opt/WifiSnuif/in/alert-macs.txt --exclude ${MAC1} ${MAC2}  >/opt/WifiSnuif/out/last.log
