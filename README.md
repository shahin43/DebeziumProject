# DebeziumProject


# Start Docker containers from the default .yaml file
docker-compose up 
docker-compose -f docker-compose-ui.yaml up

# Start Postgres connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @pgsqlconnector.json 


# Consume messages from a Debezium topic
docker-compose -f docker-compose.yaml exec kafka /kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka:9092 \
    --from-beginning \
    --property print.key=true \
    --topic localpgsql.public.users 


# Run docker commands to consume messages from the kafka topic
docker run --tty --network debeziumproject_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t postgres.public.users