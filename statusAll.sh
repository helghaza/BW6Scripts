#!/bin/bash

# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO TEA
source ./config.sh

cd $DIR

$DIR/ems status
$DIR/tea status
$DIR/bwagent status

sleep 10

