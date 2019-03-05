#!/bin/bash

TibcoInstallDir="/opt/tibco"
DomainName="lt-domain"
AppSpace="lt-appspace"
AppNode="lt-appnode"

#Change to Bin Directory
cd ${TibcoInstallDir}/bw/6.4/bin

#This would delete appnode for the specified appspace/domain
./bwadmin delete -d ${DomainName} -a ${AppSpace} appnode ${AppNode}

#This would delete appspace in the specified domain
./bwadmin delete -force -d ${DomainName} appspace ${AppSpace}

#This would delte a domain Testing
./bwadmin delete domain ${DomainName}
	
