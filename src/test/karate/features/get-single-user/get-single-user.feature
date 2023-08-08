#Name the feature using BDD convention - if the feature exists in Jira, use the same name for traceability
Feature: As a system administrator, I want to be able to view the details of a person
  #The background section is used to set parameters that will be used in every scenario in the feature file
  Background:
    Given url baseUrl

    Scenario: Valid user ID - 200 response
      #Use a given-when-then sequence as per BDD convention
      #Set http request path
      Given path 'api/users/4'

      #Set http request method
      When method GET
      #Given the correct path, when the request method is GET, then we expect the response code to be 200
      Then status 200

      * def email = response.data.email
     #We expect the response body to contain the details of the person according to their user ID
      And match response ==
      """
         {
    "data": {
        "id": #(response.data.id),
        "email": #(response.data.email),
        "first_name": #(response.data.first_name),
        "last_name": #(response.data.last_name),
        "avatar": #(response.data.avatar)
    },

    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
}
      """

      #Negative test scenario - it is important to to make sure the system is able to gracefully handle invalid input or unexpected behaviour
      #There are are wide range of negative scenarios, such as 400, 401, 502, 404 etc. This is only one example
      Scenario: Invalid user ID - 404 response
        Given path 'api/users/1413413414'
        When method GET
        Then status 404
        And match response ==
        """
        {}
        """
