# YAKS Demo

This represents the YAKS demo for Open API. 

The demo shows how to test services with [Open API](https://www.openapis.org/) specifications using Cloud Native BDD testing. 
The System Under Test (SUT) in this sample is a Camel K integration that exposes a Http REST Open API service. The automated integration tests
written with [YAKS](https://github.com/citrusframework/yaks) use the Open API specification to perform contract driven testing. 

The SUT and the YAKS BDD feature files run inside of a Kubernetes/OpenShift cluster.

# Setup

This demo assumes that you have an OpenShift cluster up and running and have access to it. It 
is also assumed that you have the [Camel K operator](https://operatorhub.io/operator/camel-k) 
installed and ready for usage on your namespace.

## Setup Quarkus application as SUT

The tests use a Quarkus web application as SUT (System Under Test). We need to start the application first before running any test.

You can run the OpenAPI fruit-store web application as follows:

```shell script
$ mvn quarkus:dev
```                             

This runs the fruit-store service that exposes the Http REST API.

## Setup YAKS operator

The YAKS operator is not (yet) available in the OperatorHub. So we need to install manually via
the yaks CLI. You can download the yaks binary from the [YAKS releases on github](https://github.com/citrusframework/yaks/tags).  

# Run YAKS tests

We are finally setup and can verify the services now by running the feature files in the 
[test](test) directory:

```shell script
$ yaks test test/01_fruits-rest-api.feature
$ yaks test test/02_fruits-open-api.feature
$ yaks test test/03_fruits-open-api.feature
$ yaks test test/04_fruits-outline.feature
$ yaks test test/05_fruits-price.feature
$ yaks test test/06_fruits-price-error.feature
```
