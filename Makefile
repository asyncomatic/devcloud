start: zookeeper-start kafka-start postgres-start scheduler-start
stop: scheduler-stop postgres-stop kafka-stop zookeeper-stop
restart: stop start

log:
	@docker-compose logs --tail=5 --follow

status:
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

zookeeper-start:
	@echo "Starting zookeeper ..."
	@docker-compose up -d zookeeper && sleep 10
zookeeper-stop:
	@echo "Stopping zookeeper ..."
	@docker kill devcloud_zookeeper && docker rm devcloud_zookeeper

kafka-start:
	@echo "Starting kafka ..."
	@docker-compose up -d kafka
kafka-stop:
	@echo "Stopping kafka ..."
	@docker kill devcloud_kafka && docker rm devcloud_kafka

postgres-start:
	@echo "Starting postgres ..."
	@docker-compose up -d postgres
postgres-stop:
	@echo "Stopping postgres ..."
	@docker kill devcloud_postgres && docker rm devcloud_postgres

scheduler-start:
	@echo "Starting scheduler ..."
	@docker-compose up -d scheduler
scheduler-stop:
	@echo "Stopping scheduler ..."
	@docker kill devcloud_scheduler && docker rm devcloud_scheduler
