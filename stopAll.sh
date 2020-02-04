#!/bin/bash
cd /opt/tibco/script
source ./config.sh

/opt/tibco/script/ems stop
/opt/tibco/script/tea stop
/opt/tibco/script/bwagent stop
sleep 30
