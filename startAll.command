#!/bin/bash
export DIR="$( cd "$( dirname "$0" )" && pwd )"
# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO TEA
source $DIR/config.sh

cd $DIR
$DIR/ems start
$DIR/tea start
$DIR/bwagent start

