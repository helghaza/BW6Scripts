#!/bin/bash
source $( dirname "$0" )/config.sh

cd $KAFKA_HOME
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > $LOGFILE_ZOO 2>&1 &

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > $LOGFILE_KAFKA 2>&1 &


#$KAFKA_HOME/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic helloTopic
#$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic helloTopic --from-beginning

sleep 30
