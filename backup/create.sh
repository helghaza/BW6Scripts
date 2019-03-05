#!/bin/bash

TibcoInstallDir="/opt/tibco/home/BW642"
DomainName="lt-domain"
AppSpace="lt-appspace"
AppNode="lt-appnode"
AppNodeHttpPort=29000

#Change to Bin Directory
cd ${TibcoInstallDir}/bw/6.4/bin

# Set bwadmin to localmode
#./bwadmin to localmode

#This would create the domain on the default bwagent.
./bwadmin create domain ${DomainName}

#This would create the appspace on domain with the specified agent.If the agent is not specified it would create with the default agent.
./bwadmin create -d ${DomainName} appspace ${AppSpace}

#This would create an appnode with available on http port on specified domain,agent and appspace.
./bwadmin create -d ${DomainName} -appspace ${AppSpace} -httpPort ${AppNodeHttpPort} appnode ${AppNode}
