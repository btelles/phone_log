Feature: Logs form saves data that users repeat commonly.
  As a user I want to enter logs quickly to be able to
  enter data very quickly.

  Scenario: The 'assigned_to' field is saved after editing a user.
    Given the following employee:
      | First Name | Carla |
      | Last Name  | Smith |
    And the following log:
      | Title | Hello this title |
    And I am on that log's edit page
    When  I select "Carla Smith" from "Assigned To"
    And I press "Save and Add Another"
    Then "Carla Smith" should be selected for "Assigned To"

