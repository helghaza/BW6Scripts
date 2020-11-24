#!/bin/bash

function log() {
	# Text color variables
	txtund=$(tput sgr 0 1)          # Underline
	txtbld=$(tput bold)             # Bold
	bldred=${txtbld}$(tput setaf 1) #  red
	bldylw=${txtbld}$(tput setaf 3) #  red
	bldblu=${txtbld}$(tput setaf 2) #  blue
	bldwht=${txtbld}$(tput setaf 7) #  white
	txtrst=$(tput sgr0)             # Reset
	info=${bldblu}*${txtrst}        # Feedback
	pass=${bldblu}*${txtrst}
	warn=${bldred}*${txtrst}
	ques=${bldblu}?${txtrst}


case "$1" in
 	INFO)
		echo -e "$(tput setaf 2)$2$txtrst"
	;;
	ERROR)
		echo -e "$bldred$2$txtrst"
	;;
	WARN)
		echo -e "$bldylw$2$txtrst"
	;;
	SUCCESS)
		echo -e "$bldblu$2$txtrst"
	;;
	*)
		echo -e "$bldwht$2$txtrst"
	;;
esac
}

error() { log ERROR " [x] $1"; }
warn() { log WARN " [!] $1"; }
success() { log SUCCESS " [i] $1"; }
inf() { log INFO " [i] $1"; } # "info" is already a command

timer() {
			echo -ne '████					(15%)\r'
		    sleep 1
		    echo -ne '████████				(30%)\r'
		    sleep 1
		    echo -ne '████████████				(45%)\r'
		    sleep 1
		    echo -ne '████████████████			(60%)\r'
		    sleep 1
		    echo -ne '████████████████████			(75%)\r'
			sleep 1
		    echo -ne '████████████████████████		(100%)\r'
		    echo -ne '\n'
}
export DIR="$( cd "$( dirname "$0" )" && pwd )"

# Set environment variables for BW
export BW_HOME=/opt/tibco/bw661/bw/6.6/
export LOGFILE_BW=$DIR/logs/tibco-bwagent_out.log

# Set environment variables for EMS
export EMS_HOME=/opt/tibco/ems/8.5
export LOGFILE_EMS=$DIR/logs/tibco-ems_out.log

# Set environment variables for TEA
export TEA_HOME=/opt/tibco/tea/tea/2.3/
export LOGFILE_TEA=$DIR/logs/tibco-tea_out.log

# Set environment variables for KAFKA
export KAFKA_HOME=/opt/tibco/akd/core/2.4/
export LOGFILE_KAFKA=$DIR/logs/tibco-kafka_out.log
export LOGFILE_ZOO=$DIR/logs/tibco-zookeeper_out.log

# Set environment variables for GEMS
export GEMS_HOME=/opt/tibco/gems/