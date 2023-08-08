Feature: As a user, I would like to login to the system


  #If time permits, will show trainees how to call a separate feature file
  Background:
    #The call read function tells karate to call and ALSO execute the feature file being called.
    * def getUserFile = call read('../get-single-user/get-single-user.feature@ValidResponse')
    #Extract email from the get-single-user feature file - email was defined as a variable
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
