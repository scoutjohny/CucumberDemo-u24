Feature: Login
  As a user I should be able to log in to the app


#  Scenario Outline: Login with a invalid credentials
#  As a user I shouldn't be able to log in using invalid credentials
#
#    Given I load test data from "TestData" "SauceDemoData" "<row>"
#    And I am on the sauce demo page
#    When I enter username
#    And I enter password
#    And I click on the login button
#    Then I should get an error message "<errorMessage>"
#
#    Examples:
#      | row | errorMessage                                                              |
#      | 1   | Epic sadface: Username and password do not match any user in this service |
#      | 2   | Epic sadface: Username and password do not match any user in this service |
#      | 3   | Epic sadface: Username and password do not match any user in this service |

  @new
  Scenario Outline: Login with a invalid credentials
  As a user I shouldn't be able to log in using invalid credentials

    Given I load test data from "TestData" "SauceDemoData" for "<tc_id>"
    And I am on the sauce demo page
    When I enter username
    And I enter password
    And I click on the login button
    Then I should get an error message "<errorMessage>"

    Examples:
      | tc_id   | errorMessage                                                              |
      | TC_0001 | Epic sadface: Username and password do not match any user in this service |
      | TC_0002 | Epic sadface: Username and password do not match any user in this service |
      | TC_0003 | Epic sadface: Username and password do not match any user in this service |