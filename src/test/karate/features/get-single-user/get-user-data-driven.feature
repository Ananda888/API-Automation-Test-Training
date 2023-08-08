Feature: As a system administrator, I want to be able to view the details of a person (data driven)
  Background:

    Given url baseUrl

    #When using multiple test data, Scenario Outline is used as technically, the scenario is slightly different as the data input changes
    Scenario Outline: Valid user ID - 200 response


      Given path 'api/users/<id>'
      #< > Tells karate that the parameter will have data fed through
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
      #The examples section is used to list the data to be used in the test. Here, we are calling the data from a csv file
      Examples:
      | read('../../../data/user-ids.csv') |

      #When the data set is small, it as acceptable to hard code the data:
#      Examples:
#      | id |
#      | 1  |
#      | 2  |
#      | 3  |
#      | 4  |
#      | 5  |
#      | 6  |


