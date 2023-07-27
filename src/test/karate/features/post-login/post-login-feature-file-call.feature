Feature: As a user, I would like to login to the system
  Background:

    * def getUserFile = call read('../get-single-user/get-single-user.feature@ValidResponse')
    * def email = getUserFile.email
    Given url baseUrl
    And path 'api/login'


  Scenario: Given that I am a user, when I enter my username and password, then I can successfully login - 200 response
    * def memberDetailsPayload =
    """
      {
    "email": "#(email)",
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