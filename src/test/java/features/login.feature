Feature: Login
  As a user I should be able to log in to the app


  Scenario: Login with a valid credentials
  As a user I should be able to log in using valid username and password

    Given I am on the sauce demo page
    When I enter valid username "standard_user"
    And I enter valid password "secret_sauce"
    And I click on the login button
    Then I should be logged in
    And I should be able to see products


  Scenario: Login with a invalid username
  As a user I shouldn't be able to log in using invalid username

    Given I am on the sauce demo page
    When I enter valid username "standard_user2"
    And I enter valid password "secret_sauce"
    And I click on the login button
    Then I should get an error message "Epic sadface: Username and password do not match any user in this service"


  Scenario: Login with a invalid password
  As a user I shouldn't be able to log in using invalid password

    Given I am on the sauce demo page
    When I enter valid username "standard_user"
    And I enter valid password "secret_sauce2"
    And I click on the login button
    Then I should get an error message "Epic sadface: Username and password do not match any user in this service"


  Scenario: Login with a invalid username and password
  As a user I shouldn't be able to log in using invalid username and passwordpassword

    Given I am on the sauce demo page
    When I enter valid username "standard_user2"
    And I enter valid password "secret_sauce2"
    And I click on the login button
    Then I should get an error message "Epic sadface: Username and password do not match any user in this service"
  @new
  Scenario Outline: Login with a invalid credentials
  As a user I shouldn't be able to log in using invalid credentials

    Given I am on the sauce demo page
    When I enter valid username "<username>"
    And I enter valid password "<password>"
    And I click on the login button
    Then I should get an error message "<errorMessage>"

    Examples:
      | username       | password     | errorMessage                                                              |
      | standard_user2 | secret_sauce | Epic sadface: Username and password do not match any user in this service |
      | standard_user2 | secret_sauce | Epic sadface: Username and password do not match any user in this service |
      | standard_user2 | secret_sauce | Epic sadface: Username and password do not match any user in this service |
      |                | secret_sauce | Epic sadface: Username is required                                        |
      | standard_user  |              | Epic sadface: Password is required                                        |
      |                |              | Epic sadface: Username is required                                        |