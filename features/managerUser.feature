Feature: api user management

 Scenario Outline: Successful registration of a new user
   Given I submit POST request on url "/api/register" using: "<email>" value to "email" field, "<password>" value to "password" field
   When I check result response
   Then I check status code 201
   And I check the field "token" containing the not empty value


   Examples:
    |email|password|
    |frlcTeste@gmail.com|qwerty123|



  Scenario Outline: Failed registration of a new user
    Given I submit POST request on url "/api/register" using: "<email>" value to "email" field
    When I check result response
    Then I check status code 400
    And I check the field "error" containing the value "Missing password"


    Examples:
    |email|
    |error@gmail.com|
    |teste123@mail.com|

  Scenario Outline: Create new user
    Given I submit POST request on url "/api/users" using: "<name>" value to "name" field, "<job>" value to "job" field
    When I check result response
    Then I check status code 201
    And I check the field "id" containing the not empty value
    And I check the field "name" containing the value "<name>"
    And I check the field "job" containing the value "<job>"

    Examples:
    |name|job|
    |Fernando Cruz|Analista de teste|
    |Wand|Programador junior|


  Scenario Outline: Create new user and update job fields
    Given I submit POST request on url "/api/users" using: "<name>" value to "name" field, "<job>" value to "job" field
    And I check value of the parameter "id" from results response
    When I submit PUT request on url "/api/users/" using: "<name>" value to "name" field, "<new_job>" value to "job" field
    When I check result response
    Then I check status code 200
    And I check the field "name" containing the value "<name>"
    And I check the field "job" containing the value "<new_job>"


    Examples:
    |name|job|new_job|
    |Fernando Cruz|Analista de teste junior|Analista de teste pleno|
    |Wand|Programador junior|Programador Pleno|
