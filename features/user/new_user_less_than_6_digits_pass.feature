Feature: User management
  In order to manage my users
  As a system's user
  I want to be able to create new users
  
  Scenario: The user should be able to create an new User with small password
    Given I am on the new "user" page with link "users/new"
    When I fill in, with small password "adilson45", "adilson.khouri.usp@gmail.com" and "23" and press "commit"
    Then I should see the message "Password is too short (minimum is 6 characters)"