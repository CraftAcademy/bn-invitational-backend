Feature: Admin is able to edit and delete information about athletes
  As an admin
  In order to keep my application up to date
  I should be able to edit and delete athletes

  Background:
    Given the following athlete exists
      | name   | home     | age | starttime |
      | Holger | Stockholm| 26  | 1337      |

  Scenario: Admin successfully edits an athlete
    Given I am on the "Holger" page
    When I click "Edit" button
    And I fill in "Name" with "David"
    And I fill in "Home" with "Stockholm"
    And I fill in "Age" with "300"
    And I fill in "Starttime" with "1337"
    And show me the page
    And I attach a file
    And I click "Submit" button
    Then I should see "Athlete successfully edited"
    And I should see "David"
    And I should see "Stockholm"
    And I should see "300"

  Scenario: Admin successfully deletes an athlete
    Given I am on the "Holger" page
    When I click "Delete Athlete" button
    Then I should be on the "Dashboard" page
    And I should see "Athlete has been deleted"
