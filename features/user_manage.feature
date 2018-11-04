


Feature: api user management


  Scenario Outline: Successful registration of a new user
    Given I send POST request on resource url "/api/register" using: "<email>" value to "email" field, "<password>" value to "password" field
    When I retrieve the results
    Then the status code should be 201
    And it should have the field "token" containing the not empty value



    Examples:
    |email|password|
    |frlcTeste@gmail.com|qwerty123|
    |frlc123@mail.com|django123|
    |teste@teste.com|Teste123|


  Scenario Outline: Unsuccessful registration of a new user
    Given I send POST request on resource url "/api/register" using: "<email>" value to "email" field
    When I retrieve the results
    Then the status code should be 400
    And it should have the field "error" containing the value "Missing password"


    Examples:
    |email|
    |error@gmail.com|
    |teste123@mail.com|


  Scenario Outline: Create new user
    Given I send POST request on resource url "/api/users" using: "<name>" value to "name" field, "<job>" value to "job" field
    When I retrieve the results
    Then the status code should be 201
    And it should have the field "id" containing the not empty value
    And it should have the field "name" containing the value "<name>"
    And it should have the field "job" containing the value "<job>"


    Examples:
    |name|job|
    |Fernando Cruz|Analista de teste|
    |Wand|Programador junior|


  Scenario Outline: Create new user and update job fields
    Given I send POST request on resource url "/api/users" using: "<name>" value to "name" field, "<job>" value to "job" field
    And I retrieve value of the parameter "id" from results
    When I send PUT request on resource url "/api/users/" using: "<name>" value to "name" field, "<new_job>" value to "job" field
    And I retrieve the results
    Then the status code should be 200
    And it should have the field "name" containing the value "<name>"
    And it should have the field "job" containing the value "<new_job>"


    Examples:
    |name|job|new_job|
    |Fernando Cruz|Analista de teste junior|Analista de teste pleno|
    |Wand|Programador junior|Programador Pleno|


  Scenario: Get single user
    Given I send GET request on resource url "/api/users/2"
    When I retrieve the results
    Then the status code should be 200
    And it should have the field "data" containing the not empty value
    And it should have the field "id" containing the value "2" in "data" field
    And it should have the field "first_name" containing the value "Janet" in "data" field
    And it should have the field "last_name" containing the value "Weaver" in "data" field



  Scenario: Single user not found
    Given I send GET request on resource url "/api/users/777"
    When I retrieve the results
    Then the status code should be 404

