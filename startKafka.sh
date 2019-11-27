#!/bin/sh

./zookeeper-server-start.sh /opt/tibco/akd/core/2.2/config/zookeeper.properties 
./kafka-server-start.sh /opt/tibco/akd/core/2.2/config/server.properties 

./kafka-console-producer.sh --broker-list localhost:9092 --topic helloTopic
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic helloTopic --from-beginning

sleep 30