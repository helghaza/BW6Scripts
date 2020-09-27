#!/bin/bash
export DIR="$( cd "$( dirname "$0" )" && pwd )"
# description: Start BusinessStudio
source $DIR/config.sh

cd $BW_HOME/../../studio/4.0/eclipse/
open $BW_HOME/../../studio/4.0/eclipse/TIBCOBusinessStudio.app

