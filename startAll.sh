#!/bin/bash

# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO TEA
source ./config.sh

cd $DIR


$DIR/ems start
$DIR/tea start
$DIR/bwagent start
sleep 20
