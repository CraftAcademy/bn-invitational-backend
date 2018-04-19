Feature: Display result on dashboard

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


Scenario: Admin visits dashboard
  Given I am on the "Dashboard" page
  Then I should see "No. 1 Kalle Score: 7.5 Number of votes: 6.0"
  Then I should see "No. 2 Holger Score: 5.0 Number of votes: 5.0"
  Then I should see "Jade Score: 10.0 Number of votes: 3.0"
