Feature: Display result on dashboard

Background:
Given the following athlete exists:
| name  | score | votes | valid_score |
| Holger| 5.0   | 5     | true        |
| Jade  | 10.0  | 3     | false       |
| Kalle | 7.5   | 6     | true        |

Scenario: Admin visits dashboard
  Given I am on the "Dashboard" page
  And show me the page
  Then I should see "No. 1 Kalle Score: 7.5, Number of votes 6"
  Then I should see "No. 2 Holger Score: 5, Number of votes 5"
  Then I should see "Not Valid: Jade Score: 10, Number of votes 3"
