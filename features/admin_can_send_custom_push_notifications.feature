Feature: Admin can send a costum push notification

Background:
  Given the following user exist:
    | email             | password   | password_confirmation|
    | admin@exampel.com | password12 | password12           |

  And I am logged in as "admin@exampel.com"

Scenario: Admin send a costum push notification
  Given I am on the "Dashboard" page
  Then I fill in "Title" with "It's Time"
  And I fill in "Content" with "For AfterSki"
  Then I click "Send Notification" button
  And I should see "Push notification successfully sent"
