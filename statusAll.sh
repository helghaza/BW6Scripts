#!/bin/bash
cd /opt/tibco/script

source /opt/tibco/script/config.sh

/opt/tibco/script/ems status
/opt/tibco/script/tea status
/opt/tibco/script/bwagent status

sleep 10

