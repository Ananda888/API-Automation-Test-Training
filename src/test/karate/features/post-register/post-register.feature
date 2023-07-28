Feature: As an interested user, I would like to successfully register for an account
  Background:
    Given url baseUrl
    When path 'api/register'

  Scenario: Successful registration with username and password - 200 response
    * def memberDetailsPayload =
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}
    """
    Given request memberDetailsPayload
    When method POST
    Then status 200
    And match response ==
    """
{
    "id": #number,
    "token": #string
}
    """


  Scenario: Failed registration, no password supplied - 400 response

    * def memberDetailsPayload =
    """
    {
    "email": "eve.holt@reqres.in",

}
    """
    Given request memberDetailsPayload
    When method POST
    Then status 400

    And match response ==
    """
{
    "error": "Missing password"
}
    """