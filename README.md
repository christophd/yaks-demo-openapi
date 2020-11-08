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

## Setup Camel K integrations as SUT

The tests use Camel K integrations as SUT (System Under Test). We need to start the Camel K integrations first before running any test.

Please make sure to have the `kamel` CLI binary available on your machine. You can install this binary
via download from the [Camel K releases on gihtub](https://github.com/apache/camel-k/releases/tag/v1.1.1).

You can run the OpenAPI greeting service and the splitter EIP as follows:

```shell script
$ kamel run camel-k/GreetingService.java --resource camel-k/openapi.json
$ kamel run camel-k/greeting-splitter.groovy
```                             

This runs the greeting service that exposes the Http REST API and the splitter that listens on the
greeting event stream and pushes the split result to the words topic.

You can review all components in the OpenShift console and make sure that everything is up and running.
Here you can also find the service URL and the Kafka broker URL. These need to be set in the feature 
files before running the tests.

## Setup YAKS operator

The YAKS operator is not (yet) available in the OperatorHub. So we need to install manually via
the yaks CLI. You can download the yaks binary from the [YAKS releases on github](https://github.com/citrusframework/yaks/tags).  

# Run YAKS tests

We are finally setup and can verify the services now by running the feature files in the 
[test](test) directory:

```shell script
$ yaks test test/greeting-service.feature
$ yaks test test/greeting-openapi.feature
$ yaks test test/greeting-outline.feature
$ yaks test test/greeting-event.feature
$ yaks test test/greeting-split-event.feature
```
