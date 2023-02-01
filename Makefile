# Start docker sync and all needed containers
start:
	docker-compose up --detach
.PHONY: start

# Stop docker sync and all needed containers
stop:
	docker-compose stop
.PHONY: stop

# Run test
test:
	docker exec -it cloudwalk-assestment_web_1 rspec
.PHONY: test

check:
	docker-compose ps
.PHONY: check

# Setup app
setup:
	docker-compose up --detach --build
	docker exec -it cloudwalk-assestment_web_1 rails db:create
	docker exec -it cloudwalk-assestment_web_1 rails db:migrate
.PHONY: setup
