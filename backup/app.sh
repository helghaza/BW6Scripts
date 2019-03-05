#!/bin/sh

TibcoInstallDir="/opt/tibco/home/BW642"
DomainName="lt-domain"
BuildDir="/home/tibco/home/BW642/plugins"
EAR="com.tibco.logtrace.perf_1.0.0.ear"
AppSpace="lt-appspace"
AppNode="lt-appnode"
AppName="com.tibco.logtrace.perf"
AppVersion="1.0"

#Change to Bin Directory
cd ${TibcoInstallDir}/bw/6.4/bin

### Check command usage ###
ScriptMode=`echo $1`

if [ "${ScriptMode}" != "deploy" ] && [ "${ScriptMode}" != "start" ] && [ "${ScriptMode}" != "stop" ] && [ "${ScriptMode}" != "status" ] && [ "${ScriptMode}" != "undeploy" ]
then
    echo "ERROR: Invalid input. Usage: DeployStartStopScript.sh <deploy|start|stop|status|undeploy>"
fi

if [ "${ScriptMode}" = "deploy" ]
then
		#This would upload the application archive to the specified domain.
		./bwadmin upload -f -replace -domain ${DomainName} ${BuildDir}/${EAR}
		
		#This would deploy the archive to the appspace with the specified domain.
		./bwadmin deploy -d ${DomainName} -a ${AppSpace} ${EAR}

elif [ "${ScriptMode}" = "undeploy" ]
then
		#This would start the appnode in the specified Appspace/Domain
		./bwadmin undeploy -d ${DomainName} -a ${AppSpace} application ${AppName} ${AppVersion}

elif [ "${ScriptMode}" = "start" ]
then
		#This would start the appnode in the specified Appspace/Domain
		./bwadmin start -d ${DomainName} -a ${AppSpace} appnode ${AppNode}

		#This would start the appspace in specified domain	
		./bwadmin start -d ${DomainName} appspace ${AppSpace}

		#This would start the appspace in specified domain	
		./bwadmin start -d ${DomainName} -a ${AppSpace} application ${AppName} ${AppVersion}

elif [ "${ScriptMode}" = "stop" ]
then
		#This would start the appspace in specified domain	
		./bwadmin stop -d ${DomainName} -a ${AppSpace} application ${AppName} ${AppVersion}

		#This would stop the appnode in specified domain/appspace
		./bwadmin stop -d ${DomainName} -a ${AppSpace} appnode ${AppNode}

		#This would stop the appspace in domain
	    	./bwadmin stop -d ${DomainName} appspace ${AppSpace}

elif [ "${ScriptMode}" = "status" ]
then
		#This would stop the appnode in specified domain/appspace
		./bwadmin status -d ${DomainName} -a ${AppSpace} applications

fi
