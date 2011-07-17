Feature: Manage Reports
  In order to see which products are most interesting or most problematic, 
  and decide which are worth spending money on,
  as a manager I want to create, edit and delete reports.

  Background:
    Given the following product:
      | name | Brace Assembly 3 |
    And the following client:
      | name | Louis Marshall |
    And the following logs:
      | Subject |
      | Customer Complaint |
      | Customer Comment   |
    And the following report:
      | name | Generic Report |
      | sql  | select * from logs limit 10 |

  Scenario: View existing log entries
    Given I am on the reports page
    Then I should see the following table rows:
      | Name | SQL |
      | Generic Report| select * from logs limit 10 |

  Scenario: Create a new report entry
    Given I am on the new report page
    And I fill in "Name" with "My Fancy Report"
    And I fill in "SQL" with "select count(*) as log_count from logs"
    And I press "Save"
    Then I should see the following table rows:
      | Name | SQL |
      | Generic Report| select * from logs limit 10 |
      | My Fancy Report | select count(*) as log_count from logs |

  Scenario: View a report
    Given the following report:
      | name | First Generic Report |
      | sql  | select count(*) as log_count from logs |
    And I am on the reports page
    And I follow "First Generic Report"
    Then I should see the following table rows:
      | Log Count |
      | 2         |

  Scenario: Edit an existing report entry
    Given I am on the reports page
    And I follow "Edit"
    And I fill in "Name" with "Some other report subject"
    And I fill in "SQL" with "select (count(*)+1) as log_count from logs"
    And I press "Save"
    Then I should see the following table rows:
      | Name | SQL |
      | Some other report subject | select (count(*)+1) as log_count from logs |
