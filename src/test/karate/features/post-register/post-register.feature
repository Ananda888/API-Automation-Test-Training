Feature: As an interested user, I would like to successfully register for an account
  Background:
    Given url baseUrl
    And path 'api/register'

  Scenario: Given I am an interested user, when I enter my username and password, then I should be able to successfully register - 200 response
    * def memberDetailsPayload =
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}
    """
    And request memberDetailsPayload
    When method POST
    Then status 200
    And match response ==
    """
{
    "id": #number,
    "token": #string
}
    """


  Scenario: Given I am an interested user, when I enter my username only, then I cannot register due to not providing a password - 400 response

    * def memberDetailsPayload =
    """
    {
    "email": "eve.holt@reqres.in",

}
    """
    And request memberDetailsPayload

    When method POST
    Then status 400
    And match response ==
    """
{
    "error": "Missing password"
}
    """