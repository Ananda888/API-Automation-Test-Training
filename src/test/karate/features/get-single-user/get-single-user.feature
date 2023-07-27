Feature: As a system administrator, I want to be able to view the details of a person
  Background:
    Given url baseUrl


    @ValidResponse
    Scenario: Given I am a system administrator, when I enter a valid user id, then I can view the details that person - 200 response

      And path 'api/users/4'
      When method GET
      Then status 200

      * def email = response.data.email

      And match response ==
      """
         {
    "data": {
        "id": #number,
        "email": #string,
        "first_name": #string,
        "last_name": #string,
        "avatar": "https://reqres.in/img/faces/4-image.jpg"
    },

    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
}
      """
      Scenario: Given I am a system administrator, when I enter an invalid user id, then the api returns a not found error - 404 response
        And path 'api/users/1413413414'
        When method GET
        Then status 404
        And match response ==
        """
        {}
        """
