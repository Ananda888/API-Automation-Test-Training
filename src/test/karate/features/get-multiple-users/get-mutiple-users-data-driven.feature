Feature: As a system administrator, I would like to see the details of all users
  Background:
    #Script together with trainees to get them familiar with data-driven scenarios.
    #* def page = read('../../../data/pages.csv')

    Given url baseUrl
    When path 'api/users'

  Scenario Outline: All user details visible - 200 response

      * def query =
      """
    {
    "page": "<page>"
    }
      """

    Given params query
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
      | read('../../../data/pages.csv') |

#        Examples:
#        | page |
#        |  1   |
#        |  2   |
