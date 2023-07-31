Feature: As a system administrator, I want to be able to view the details of a person
  #Script together with trainees to introduce them to basic Karate api test scripting and get requests
  Background:
    Given url baseUrl

    @ValidResponse
    Scenario: Valid user ID - 200 response

      Given path 'api/users/4'
      When method GET
      Then status 200

      * def email = response.data.email

      And match response ==
      """
         {
    "data": {
        "id": #(response.data.id),
        "email": #(response.data.email),
        "first_name": #(response.data.first_name),
        "last_name": #(response.data.last_name),
        "avatar": "https://reqres.in/img/faces/4-image.jpg"
    },

    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
}
      """
      Scenario: Invalid user ID - 404 response
        Given path 'api/users/1413413414'
        When method GET
        Then status 404
        And match response ==
        """
        {}
        """
