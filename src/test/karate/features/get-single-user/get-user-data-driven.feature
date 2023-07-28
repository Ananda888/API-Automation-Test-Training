Feature: As a system administrator, I want to be able to view the details of a person
  Background:

    Given url baseUrl

    Scenario Outline: Valid user ID - 200 response

      Given path 'api/users/<id>'
      When method GET
      Then status 200

      And match response ==
     """
      {
    "data": {
        "id": #(response.data.id),
        "email": #(response.data.email),
        "first_name": #(response.data.first_name),
        "last_name": #(response.data.last_name),
        "avatar": "https://reqres.in/img/faces/<id>-image.jpg"
    },
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
      """
      Examples:
      | read('../../../data/user-ids.csv') |




