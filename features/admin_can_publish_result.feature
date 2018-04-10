Feature: Admin can publish result
  As an admin
  In order to inform my end users the result of the competition
  I would like to be able to share the results.

Scenario: Admin clicks publish result
  Given I am on the "Dashboard" page
  When I click "Publish Result" button
  Then I should see "Result successfully published"
