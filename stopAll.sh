#!/bin/bash

# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO TEA
source ./config.sh

cd $DIR

$DIR/ems stop
$DIR/tea stop
$DIR/bwagent stop
sleep 30
