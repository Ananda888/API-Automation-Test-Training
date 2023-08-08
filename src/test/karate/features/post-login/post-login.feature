Feature: As a user, I would like to login to the system
  Background:
    Given url baseUrl

  Scenario: Successful login - 200 response
    #Since this is a post request, the api requires a user input. We define the payload here
    * def memberDetailsPayload =
    """
      {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
    """
    Given path 'api/login'
    #Set the request payload by using "And request"
    And request memberDetailsPayload
    When method POST
    Then status 200

    # Token is randomly generated, so it can be any string.
    And match response ==
    """
      {
      "token": #string
     }
    """
  #Negative test case - if request payload parameters are missing or invalid, you typically expect a 400 bad request
  Scenario: Failed login, password missing - 400 response
    * def memberDetailsPayload =
    """
  {
  "email": "eve.holt@reqres.in",

  }
    """
    Given path 'api/login'
    And request memberDetailsPayload
    When method POST
    Then status 400
    And match response ==
    """
    {
    "error": "Missing password"

    }
    """

    #When an incorrect password, or authentication token is supplied, the system throws a 401 unauthorized error.
  #This website accepts any password as a successful input, so this example will not work. Showing as an example only as to what happens normally
#  Scenario: Incorrect password - login failure - 401 response
#
#    * def memberDetailsPayload =
#    """
#      {
#    "email": "eve.holt@reqres.in",
#    "password": "kjfgnjksngosn"
#}
#    """
#    Given request memberDetailsPayload
#    When method POST
#    Then status 401
#
#    And match response ==
#    """
#      {
#      "Unauthorised! Login failure"
#     }
#    """