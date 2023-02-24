# Pact Example

## Running Broker

- Supports EKS with Helm chart.
- Supports cloud hosting.

### Local Testing

`make start`

### CLI

You can use the pact CLI to interact with the broker.

`docker run --network pact-example_pact --rm pactfoundation/pact-cli:latest pact-broker list-environments --broker-base-url http://pact-broker:9292`

## Pushing Pacts

Pacts are generated generally by code. These pacts need to be pushed to the broker.

You can do this in multiple ways:

- Via the CLI.
- Via a Gradle plugin.

