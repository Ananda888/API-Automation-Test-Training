Feature: As a user, I would like to login to the system
  Background:
    Given url baseUrl
    And path 'api/login'


  Scenario: Given that I am a user, when I enter my username and password, then I can successfully login - 200 response
    * def memberDetailsPayload =
    """
      {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
    """
    And request memberDetailsPayload
    When method POST
    Then status 200
    * def token = response.token

    And match response ==
    """
      {
      "token": #string
     }
    """

  Scenario: Given that I am a user, when I enter only my username, I cannot login due to failing to supply my password - 400 response
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
