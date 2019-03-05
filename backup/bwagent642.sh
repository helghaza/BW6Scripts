#!/bin/bash

# chkconfig: 3 90 20
# description: Startup/Shutdown TIBCO Enterprise Message Server


# Set environment variables
export DIR="$( cd "$( dirname "$0" )" && pwd )"
export TIBCO_HOME=/opt/tibco/home/BW642
export BW_HOME=$TIBCO_HOME/bw/6.4
export LOGFILE=$DIR/logs/tibco-bwagent_out.log



case "$1" in
 	start)
		echo "Starting TIBCO BusinessWorks Agent"
        bw_pid=`pidof bwagent`
		if [ -z $bw_pid ]
	    	then
			cd $BW_HOME/bin/
            echo "$BW_HOME/bin/bwagent > $LOGFILE 2>&1 &"
		    $BW_HOME/bin/bwagent > $LOGFILE 2>&1 &
            cd -
		    echo -ne '#####                     (33%)\r'
		    sleep 2
		    echo -ne '#############             (66%)\r'
		    sleep 2
		    echo -ne '#######################   (100%)\r'
		    echo -ne '\n'
		    $0 status	
	    else 
            echo -e "\t==> TIBCO BW Agent is already started (PID: $bw_pid)."
        fi
        
		;;
 	stop)
        echo "Stopping TIBCO BusinessWorks AppNodes"
		for var in `find /opt/tibco/home/BW642 -name "stopBWAppNode.sh"` 
		do 
			echo $var
			. $var 
		done 
		
		echo "Stopping TIBCO BusinessWorks Agent"
	    bw_pid=`pidof bwagent`
		if [ -z $bw_pid ]
	    	then
			echo "ERROR: No bwagent pid found. Nothing to stop... "
	    	exit 1
	    	fi
		kill `pidof bwagent` >> $LOGFILE 2>&1
		echo "TIBCO BWAgent - stopped ! (PID: $bw_pid)."
		;;
	status)
		
        echo "Status of TIBCO BusinessWorks Agent"
        bw_pid=`pidof bwagent`
		if [ -z $bw_pid ]
	    	then
			echo -e "\t==> TIBCO BW Agent is stopped."
		else
			echo -e "\t==> TIBCO BW Agent is started (PID: $bw_pid)."
	    	fi
		
		echo "Status of TIBCO BusinessWorks AppNodes"
        bwAN_pid=`pidof bwappnode`
		if [ -z $bwAN_pid ]
	    	then
			echo -e "\t==> TIBCO BW AppNode is stopped."
		else
			echo -e "\t==> TIBCO BW AppNode is started (PID: $bwAN_pid)."
	    	fi
		;;
	restart)
		$0 stop
   		$0 start
	  	;;
  *)
		echo "Usage: $0 {start|stop|restart|status}"
		exit 1
		;;
esac
exit 0
																  
