#!/bin/bash
export DIR="$( cd "$( dirname "$0" )" && pwd )"
# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO TEA
source $DIR/config.sh

cd $DIR
$DIR/ems status
$DIR/tea status
$DIR/bwagent status


