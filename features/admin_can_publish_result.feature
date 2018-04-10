Feature: Admin can publish result
  As an admin
  In order to inform my end users the result of the competition
  I would like to be able to share the results.

  Background:
  Given the following athlete exists with these results:
  | name  | score | votes | valid_score |
  | Holger| 5.0   | 5     | true        |
  | Jade  | 10.0  | 3     | false       |
  | Kalle | 7.5   | 6     | true        |

Scenario: Admin clicks publish result
  Given I am on the "Dashboard" page
  When I click "Publish Result" button
  Then I should see "Result successfully published"
