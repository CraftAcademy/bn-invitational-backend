Feature: Admin can revert result
  Just for testing, will be removed.

  Background:
    Given the following athlete exists with these results:
      | name  | score | votes | valid_score |
      | Holger| 5.0   | 5     | true        |
      | Jade  | 10.0  | 3     | false       |
      | Kalle | 7.5   | 6     | true        |

    And the following user exist:
      | email             | password   | password_confirmation|
      | admin@exampel.com | password12 | password12           |

    And I am logged in as "admin@exampel.com"


Scenario: Admin clicks publish result
  Given I am on the "Dashboard" page
  When I click "Revert Result" button
  Then I should see "Result successfully reverted"
