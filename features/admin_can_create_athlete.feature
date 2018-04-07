Feature: Admin is able to create a new athlete
  As an admin
  In order to have athletes in my competition
  I would like to be able to create athletes

  Scenario: Admin successfully creates new athlete
    Given I am on the "Dashboard" page
    When I click "Create Athlete" button
    Then I should be on the "Create Athlete" page
    When I fill in "Name" with "Holger"
    And I fill in "Home" with "Göteborg"
    And I fill in "Age" with "26"
    And I fill in "Start Time " with "1337"
    And I attach a file
    And I click "Submit" button
    Then I should see "Athlete successfully created"
