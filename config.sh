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
	info=${bldwht}*${txtrst}        # Feedback
	pass=${bldblu}*${txtrst}
	warn=${bldred}*${txtrst}
	ques=${bldblu}?${txtrst}


case "$1" in
 	INFO)
		echo -e "$bldwht$2$txtrst"
	;;
	ERROR)
		echo -e "$bldred$2$txtrst"
	;;
	WARN)
		echo -ne "$bldylw$2$txtrst"
	;;
	SUCCESS)
		echo -e "$bldblu$2$txtrst"
	;;
	*)
		echo -e "$bldwht$2$txtrst"
	;;
esac
}

error() { log ERROR "$1"; }
warn() { log WARN "$1"; }
success() { log SUCCESS "$1"; }
inf() { log INFO "$1"; } # "info" is already a command

export DIR="$( cd "$( dirname "$0" )" && pwd )"

# Set environment variables for BW
export BW_HOME=/opt/tibco/home/BW660/bw/6.6
export LOGFILE_BW=$DIR/logs/tibco-bwagent_out.log

# Set environment variables for EMS
export DIR="$( cd "$( dirname "$0" )" && pwd )"
export EMS_HOME=/opt/tibco/EMS840/ems/8.4
export LOGFILE_EMS=$DIR/logs/tibco-ems_out.log



# Set environment variables for TEA
export DIR="$( cd "$( dirname "$0" )" && pwd )"
export TEA_HOME=/opt/tibco/home/BW642/tea/2.3
export LOGFILE_TEA=$DIR/logs/tibco-tea_out.log
