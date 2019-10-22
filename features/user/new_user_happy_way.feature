Feature: User management
  In order to manage my users
  As a system's user
  I want to be able to create new users
  
  Scenario: The user should be able to create an new User
    Given I am on the new "user" page with link "users/new"
    When I fill in "adilson333", "adilson.khouri.usp@gmail.com" and "2345677878" and press "commit"
    Then I should see the message "Welcome to the Mercado Livre da construção"