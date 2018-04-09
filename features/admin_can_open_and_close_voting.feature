Feature: Admin can close and open voting
  As an admin
  In order to inform my end users the result of the competition
  I would like to be able to share the results.

Background:
Given the following athlete exists
  | name        | home       | age  | votingOpen |
  | Kalle Tomba | Dagali     | 78   | false      |

Scenario: Admin open the voting for an athlete
  Given I am on the "Dashboard" page
  Then I should see "Status: false"
  When I click "voting" button
  Then I should see "Status: true"
