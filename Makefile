host := http://olympus-pact.main0.api.olym.dev.euw1.vonagenetworks.net

start:
	docker-compose up -d

list-envs:
	docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker list-environments --broker-base-url $(host)

publish:
	source .env; docker run -v "$$SOURCE:/pacts" --network pact-example_pact --rm pactfoundation/pact-cli:latest publish \
	--broker-base-url $(host) --consumer-app-version 1 /pacts

can-i-deploy:
	docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker can-i-deploy --broker-base-url $(host) --pacticipant chatappInboundHandler --latest

deploy-eks:
	helm repo add pact-broker https://pact-foundation.github.io/pact-broker-chart/
	helm upgrade --install pact-broker pact-broker/pact-broker --set ingress.className=ingress-controller-internal-nginx --set ingress.host=olympus-pact.main0.api.olym.dev.euw1.vonagenetworks.net --set broker.config.webhookSchemeWhitelist=http
