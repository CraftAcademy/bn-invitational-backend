Feature: Admin is able to edit and delete information about athletes
  As an admin
  In order to keep my application up to date
  I should be able to edit and delete athletes

  Background:
    Given the following athlete exists with these results:
      | name  | score | votes | valid_score | home      | age | starttime |
      | Holger| 5.0   | 5     | true        | Stockholm | 26  | 1337      |

    And the following user exist:
      | email             | password   | password_confirmation|
      | admin@exampel.com | password12 | password12           |

    And I am logged in as "admin@exampel.com"

  Scenario: Admin successfully edits an athlete
    Given I am on the "Dashboard" page
    When I click "Edit" button
    And I fill in "Name" with "David"
    And I fill in "Home" with "Stockholm"
    And I fill in "Age" with "300"
    And I fill in "Starttime" with "1337"
    And I attach a file
    And I click "Update Athlete" button
    And I should see "David"
    And I should see "Stockholm"
    And I should see "300"

  Scenario: Admin successfully deletes an athlete
    Given I am on the "Dashboard" page
    When I click "Delete" button
    Then I should be on the "Dashboard" page
