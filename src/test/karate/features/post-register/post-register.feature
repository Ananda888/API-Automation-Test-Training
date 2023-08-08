Feature: As an interested user, I would like to successfully register for an account
  Background:
    Given url baseUrl

  Scenario: Successful registration with username and password - 200 response

    #Since this is a post request, the api requires a user input. We define the payload here
    * def memberDetailsPayload =
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}
    """
    Given path 'api/register'
        #Set the request payload by using "And request"
    And request memberDetailsPayload
    When method POST
    Then status 200

    #Id and token are randomly generated. Id takes on any number and Id takes on any string
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
    Given path 'api/register'
    And request memberDetailsPayload
    When method POST
    Then status 400

    And match response ==
    """
{
    "error": "Missing password"
}
    """