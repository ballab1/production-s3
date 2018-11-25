@echo off
:: Usage: source set-kafka-cluster dev|dur|hop|local|home


if [%1]==[dev] call :dev
if [%1]==[dur] call :dur
if [%1]==[hop] call :hop
if [%1]==[local] call :local
if [%KAFKA_CLUSTER%]==[] call :usage

call "%0\..\show-kafka-cluster.cmd"
::exit /b 0
goto done

:dur
   :: Durham cluster -- Steve Vedell RITM0259942
   ::        broker1.cec.lab.emc.com  (10.207.113.56)
   ::        broker2.cec.lab.emc.com  (10.207.113.53)
   ::        broker3.cec.lab.emc.com  (10.207.113.55)
   ::        zookeeper.cec.lab.emc.com  (10.207.113.52)
   ::        zookeeper2.cec.lab.emc.com  (10.207.113.54)
   ::        avro-schema.cec.lab.emc.com  (10.207.113.50)
   set KAFKA_AVRO_HOSTS=avro-schema.cec.lab.emc.com
   set KAFKA_BOOTSTRAP_SERVERS=broker1.cec.lab.emc.com:9092,broker2.cec.lab.emc.com:9092,broker3.cec.lab.emc.com:9092
   set KAFKA_CLUSTER=dur
   set ZOOKEEPER_HOSTS=zookeeper.cec.lab.emc.com:2181,zookeeper2.cec.lab.emc.com:2181
   exit /b

:hop
   :: Hopkinton cluster -- Vijay Basava  10gb Optical SLICS
   :: root / ChangeM3!
   set KAFKA_AVRO_HOSTS=kafkaavrosch01
   set KAFKA_BOOTSTRAP_SERVERS=kafkabroker01.cec.lab.emc.com:9092,kafkabroker02.cec.lab.emc.com:9092,kafkabroker03.cec.lab.emc.com:9092
   set KAFKA_CLUSTER=hop
   set ZOOKEEPER_HOSTS=kafkazookpr01.cec.lab.emc.com:32181,kafkazookpr02.cec.lab.emc.com:32181
   exit /b

:dev
   set KAFKA_AVRO_HOSTS=10.244.102.59
   set KAFKA_BOOTSTRAP_SERVERS=10.244.102.59:9092
   set KAFKA_CLUSTER=dev
   set ZOOKEEPER_HOSTS=10.244.102.59:2181
   exit /b

:local
   set KAFKA_AVRO_HOSTS=localhost
   set KAFKA_BOOTSTRAP_SERVERS=localhost:9092
   set KAFKA_CLUSTER=local
   set ZOOKEEPER_HOSTS=localhost:2181
   exit /b

:usage
   echo.
   echo "Usage: set-kafka-cluster.cmd dev|dur|hop|local"
   echo.
   ::exit 1

:done