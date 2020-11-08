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
      "tags": "@assertThat(not(empty())@"
    }
    """
    Then receive HTTP 200 OK

  Examples:
    | id   | name       | category | status    |
    | 1000 | Apple      | pome     | AVAILABLE |
    | 1001 | Pineapple  | tropical | PENDING   |
    | 1002 | Strawberry | berry    | SOLD      |
