Feature: Manage logs
  In order to see which products are most interesting or most problematic, 
  and decide which are worth spending money on improving
  as a phone operator I want to create and delete phone log entries.
  
  Scenario: Create a new log entry
    Given I am on the new log page
    And   I fill in "Subject" with "Some new log subject"
    And I press "Save"
    Then I should see the following table rows:
      | Subject              |
      | Some new log subject |

  Scenario: Delete a log entry
    Given the following logs:
      | Subject |
      | Customer Complaint |
      | Customer Comment   |
      | Super comment|
      | Kudos |
    When I delete the 3rd log
    Then I should see the following logs:
      | Subject |
      | Customer Complaint |
      | Customer Comment   |
      | Kudos |
