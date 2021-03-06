Feature: Admin sign in and out
As an admin
In order to access and administrate the application
I should be able to log in and out

Background:
  Given the following user exist:
  | email             | password   | password_confirmation|
  | admin@exampel.com | password12 | password12           |

Scenario: Admin can login and out
  Given I am on the "Dashboard" page
  When I fill in "Email" with "admin@exampel.com"
  And I fill in "Password" with "password12"
  Then I click "Log in" button
  And I should see "Signed in successfully."
  Then I click "Logout" button
  And I should see "Signed out successfully"
