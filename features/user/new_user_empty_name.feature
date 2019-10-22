Feature: User management
  In order to manage my users
  As a system's user
  I want to be able to create new users
  
  Scenario: The user should be able to create an new User with empty description
    Given I am on the new user page, with an empty name, with link "users/new"
    When I fill in, with an empty name "", "adilson.khouri.usp@gmail.com" and "2345677878" and press "commit"
    Then I see, with an empty name, the message "can't be blank"