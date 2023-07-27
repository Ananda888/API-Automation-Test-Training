Feature: As a system administrator, I would like to see the details of all users
  Background:
    * def page = read('../../../data/pages.csv')

    Given url baseUrl
    And path 'api/users'

  Scenario Outline: Given that I am a system administrator, when I enter in a page number, then I should be able to see all the users existing on that page - 200 response

      * def query =
      """
    {
    "page": "<page>"
    }
      """

      And params query
      When method GET
      Then status 200


      And match response ==
    """
    {
    "page": <page>,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
        },
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
        },
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
          },
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
        },
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
        },
        {
            "id": #number,
            "email": #string,
            "first_name": #string,
            "last_name": #string,
            "avatar": #string
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
    """

      Examples:
      | page |
