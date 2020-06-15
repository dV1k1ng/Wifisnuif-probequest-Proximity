#!/bin/bash
#
pid=`ps -ef | grep " probequest " | cut -d " " -f7 | cut -d $'\n' -f1`
echo "Sending SIGINT to proces " $pid
kill -INT $pid
sudo mv -f /opt/WifiSnuif/out/last.log /opt/WifiSnuif/out/prev.log
