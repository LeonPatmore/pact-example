# Pact Example

## Running Broker

- Supports EKS with Helm chart.
- Supports cloud hosting.

### Local Testing

`make start`

### EKS

`make deploy-eks`

### CLI

You can use the pact CLI to interact with the broker.

`docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker list-environments --broker-base-url http://pact-broker:9292`

## Pushing Pacts

Pacts are generated generally by code. These pacts need to be pushed to the broker.

You can do this in multiple ways:

- Via the CLI.
- Via a Gradle plugin.

## Verifing Pacts

There are two times you need to verify a pact:

- If the provider changes. In this case, all pacts using this provider need to be re-verified.
- If a consumer pact changes. In this case, this pact needs to be re-verified. To do this, the provider must be triggered to re-run.

## Setting up the webhook


``` bash
curl --location 'http://olympus-pact.main0.api.olym.dev.euw1.vonagenetworks.net/webhooks' \
--header 'Content-Type: application/json' \
--data '{
    "events": [{
        "name": "contract_requiring_verification_published"
    }],
    "request": {
        "method": "POST",
        "url": "http://jenkins-olympus01.eu-west-2.dev.nexmo.xxx:8080/job/CI/job/TriggerContract/buildWithParameters?SERVICE=${pactbroker.providerName}&CONSUMER_BRANCH=${pactbroker.consumerVersionBranch}",
        "headers": {
            "Content-Type": "application/json"
        }
    }
}
'
```
