Feature: Admin is able to see all atletes
  As an admin
  In order to know which athletes are attending the competation
  I would like to se all athletes listets

  Background:
    Given the following athlete exists
      | name        | home       | age  |
      | Kalle Tomba | Dagali     | 78   |

    And the following user exist:
    | email             | password   | password_confirmation|
    | admin@exampel.com | password12 | password12           |

    And I am logged in as "admin@exampel.com"


  Scenario: Admin looks at index page
    Given I am on the "Dashboard" page
    Then I should see 'Kalle Tomba'
