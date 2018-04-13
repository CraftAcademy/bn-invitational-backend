Feature: Admin can close and open voting
  As an admin
  In order to inform my end users the result of the competition
  I would like to be able to share the results.

Background:
Given the following athlete exists
  | name        | home       | age  | votingOpen |
  | Kalle Tomba | Dagali     | 78   | false      |

And the following user exist:
  | email             | password   | password_confirmation|
  | admin@exampel.com | password12 | password12           |

And I am logged in as "admin@exampel.com"


Scenario: Admin open the voting for an athlete
  Given I am on the "Dashboard" page
  Then I should see "Status: false"
  When I click "voting" button
  Then I should see "Status: true"
