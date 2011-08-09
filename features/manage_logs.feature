Feature: Manage logs
  In order to see which products are most interesting or most problematic,
  and decide which are worth spending money on,
  as a phone operator I want to create, edit and delete phone log entries.

  Background:
    Given the following company:
      | Name | Louis Marshall |
    Given the following employee:
       | First Name | Bob   |
       | Last Name  | Smith |

  Scenario: View existing log entries
    Given the following logs:
      | Title |
      | Customer Complaint |
      | Customer Comment   |
    And I am on the logs page
    Then I should see the following table rows:
      | Title |
      | Customer Complaint |
      | Customer Comment   |

  Scenario: Create a new log entry
    Given I am on the new log page
    And   I fill in "Title" with "Call Log entry"
    And   I select "Bob Smith" from "Assigned To"
    And   I select "Outbound" from "In/Outbound"
    And   I select "Louis Marshall" from "Company"
    And   I select "2011-07-16" as the "Opened Date" date
    #And   I fill in "Store Number" with "111"
    #And   I select "Advise RMA Result" from "Reason Code"
    #And   I select "Can I get a track #" from "Additional Reason Codes"
    #And   I select "Brace Assembly 3" from "Product Code"
    #And   I select "Yes" from "Escalated"
    #And   I select "Account Services" from "Escalated To"
    #And   I select "< 3 Minutes" from "Duration"
    #And   I fill in "Order/RMA Number" with "AB34"
    And   I press "Save"
    Then show me the page
    Then I should see the following table rows:
      | Title          |
      | Call Log entry |

  Scenario: Edit an existing log entry
    Given the following log:
      | Title | Customer Complaint |
    And I am on the logs page
    And I follow "Edit"
    And I fill in "Title" with "Some other log subject"
    #And I select "Brace Assembly 3" from "Product"
    #And I select "Louis Marshall" from "Client"
    And I press "Save"
    Then I should see the following table rows:
      | Title              |
      | Some other log subject |

  Scenario: Delete a log entry
    Given the following logs:
      | Title |
      | Customer Complaint |
      | Customer Comment   |
      | Kudos |
      | Super comment|
    When I delete the 3rd log
    Then I should see the following logs:
      | Title |
      | Customer Complaint |
      | Customer Comment   |
      | Kudos |
