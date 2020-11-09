Feature: Fruit Store API

  Background:
    Given URL: http://localhost:8080

  Scenario Outline: getFruits
    And HTTP request header Content-Type is "application/json"
    When send GET /fruits/<id>
    Then verify HTTP response header Content-Type="application/json"
    And verify HTTP response body
    """
    {
      "id": <id>,
      "name": "<name>",
      "description": "@ignore@",
      "category":{
        "id": "@isNumber()@",
        "name":"<category>"
      },
      "status": "<status>",
      "price": <price>,
      "tags": "@assertThat(not(empty())@"
    }
    """
    Then receive HTTP 200 OK

  Examples:
    | id   | name       | category | price | status    |
    | 1000 | Apple      | pome     | 1.59  | AVAILABLE |
    | 1001 | Pineapple  | tropical | 1.99  | PENDING   |
    | 1002 | Strawberry | berry    | 2.50  | SOLD      |
