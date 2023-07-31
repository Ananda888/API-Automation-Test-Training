Feature: As a user, I would like to login to the system


  #If time permits, will show trainees how to call a separate feature file
  Background:

    * def getUserFile = call read('../get-single-user/get-single-user.feature@ValidResponse')
    * def email = getUserFile.email
    Given url baseUrl
    And path 'api/login'


  Scenario: Successful login - 200 response
    * def memberDetailsPayload =
    """
      {
    "email": "#(email)",
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
