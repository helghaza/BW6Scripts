#!/bin/sh

/opt/tibco/akd/core/2.4/bin/zookeeper-server-start.sh /opt/tibco/akd/core/2.4/config/zookeeper.properties 
/opt/tibco/akd/core/2.4/bin/kafka-server-start.sh /opt/tibco/akd/core/2.4/config/server.properties 

/opt/tibco/akd/core/2.4/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic helloTopic
/opt/tibco/akd/core/2.4/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic helloTopic --from-beginning

sleep 30