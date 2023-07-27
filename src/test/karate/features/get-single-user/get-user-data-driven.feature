Feature: As a system administrator, I want to be able to view the details of a person
  Background:

    * def id = read('../../../data/user-ids.csv')
    Given url baseUrl

    Scenario Outline: Given I am a system administrator, when I enter a valid user id, then I can view the details that person - 200 response
      Given path 'api/users/<id>'
      When method GET
      Then status 200

      And match response ==
     """
      {
    "data": {
        "id": #number,
        "email": #string,
        "first_name": #string,
        "last_name": #string,
        "avatar": "https://reqres.in/img/faces/<id>-image.jpg"
    },
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
      """
      Examples:
      | id |




