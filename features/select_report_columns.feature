Feature: As a user I want to select columns easily
  So that I don't have to spend time learning SQL

  Scenario: Before selecting at least one table
    Given an existing report
    And I am on the reports page
    When  I follow "Edit"
    Then  I should see "Please select a main table to query."
    And   I should see "products"
    And   I should see "clients"
    And   I should see "logs"
