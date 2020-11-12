Feature: Fruit Store Open API

  Background:
    Given OpenAPI specification: http://fruit-store-openapi-demo/openapi
    Given variable id is "1002"
    Given variable key is "strawberry"
    Given HTTP server "market-service"
    And HTTP server listening on port 8080
    And HTTP server timeout is 10000 ms
    And OpenAPI request fork mode is enabled

  Scenario: getPriceUpdate
    Given create Kubernetes service market-service with target port 8080
    When invoke operation: getPriceUpdate
    Then receive GET /prices/fruits/${key}
    And send HTTP 500 INTERNAL_SERVER_ERROR
    Then verify operation result: 500 INTERNAL_SERVER_ERROR
