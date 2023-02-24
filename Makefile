start:
	docker-compose up -d

list-envs:
	docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker list-environments --broker-base-url http://pact-broker:9292

publish:
	cd C:/Users/Work/Documents/GitHub/chatapp-inbound-handler && \
	docker run -v C:/Users/Work/Documents/GitHub/chatapp-inbound-handler/build/pacts:/pacts --network pact-example_pact --rm pactfoundation/pact-cli:latest publish \
	--broker-base-url http://pact-broker:9292 --consumer-app-version 1 /pacts
