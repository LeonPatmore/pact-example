start:
	docker-compose up -d

list-envs:
	docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker  list-environments --broker-base-url http://pact-broker:9292

publish:
	source .env; docker run -v "$$SOURCE:/pacts" --network pact-example_pact --rm pactfoundation/pact-cli:latest publish \
	--broker-base-url http://pact-broker:9292 --consumer-app-version 1 /pacts

can-i-deploy:
	docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest  pact-broker can-i-deploy --broker-base-url http://pact-broker:9292 --pacticipant chatappInboundHandler --latest

stop:
	docker-compose stop
	docker-compose rm  -f -v
	docker volume rm pact-example_postgres-volume
