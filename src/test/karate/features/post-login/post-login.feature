Feature: As a user, I would like to login to the system\

  #Trainees will script this on their own
  Background:
    Given url baseUrl
    When path 'api/login'


  Scenario: Successful login - 200 response
    * def memberDetailsPayload =
    """
      {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
    """
    Given request memberDetailsPayload
    When method POST
    Then status 200
    * def token = response.token

    And match response ==
    """
      {
      "token": #string
     }
    """

  Scenario: Failed login, password missing - 400 response
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
