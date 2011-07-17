Feature: Manage logs
  In order to see which products are most interesting or most problematic, 
  and decide which are worth spending money on,
  as a phone operator I want to create, edit and delete phone log entries.

  Background:
    Given the following product:
      | name | Brace Assembly 3 |
    And the following client:
      | name | Louis Marshall |

  Scenario: View existing log entries
    Given the following logs:
      | Subject |
      | Customer Complaint | 
      | Customer Comment   |
    And I am on the logs page
    Then I should see the following table rows:
      | Subject |
      | Customer Complaint |
      | Customer Comment   |

  Scenario: Create a new log entry
    Given I am on the new log page
    And I select "2011-07-16" as the "Logged at" date
    And I fill in "Subject" with "Some new log subject"
    And I select "Brace Assembly 3" from "Product"
    And I select "Louis Marshall" from "Client"
    And I press "Save"
    Then I should see the following table rows:
      | Subject              | Client | Product |
      | Some new log subject | Louis Marshall | Brace Assembly 3 |

  Scenario: Edit an existing log entry
    Given the following log:
      | Subject | Customer Complaint |
    And I am on the logs page
    And I follow "Edit"
    And I fill in "Subject" with "Some other log subject"
    And I select "Brace Assembly 3" from "Product"
    And I select "Louis Marshall" from "Client"
    And I press "Save"
    Then I should see the following table rows:
      | Subject              | Client | Product |
      | Some other log subject | Louis Marshall | Brace Assembly 3 |

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
