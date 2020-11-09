Feature: Fruit Store Open API

  Background:
    Given OpenAPI specification: http://localhost:8080/openapi
    Given variable id is "1002"
    Given variable key is "strawberry"
    Given variable price is "2.55"
    Given inbound dictionary
      | $.name          | Strawberry |
      | $.category.name | berry      |
      | $.price         | ${price}   |
    Given HTTP server "market-service"
    And HTTP server listening on port 8081
    And OpenAPI request fork mode is enabled

  Scenario: getPriceUpdate
    When invoke operation: getPriceUpdate
    Then receive GET /market/prices/fruits/${key}
    And HTTP response header: Content-Type is "application/json"
    And HTTP response body: { "name": "${key}", "value": ${price} }
    And send HTTP 200 OK
    Then verify operation result: 200 OK

  Scenario: getFruit
    When invoke operation: getFruitById
    Then verify operation result: 200 OK
