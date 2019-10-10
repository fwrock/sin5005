Feature: Product management
  In order to manage my products
  As a system's user (salesman)
  I want to be able to create new produtcs
  
  Scenario: The user should be able to create an new Product with empty description
    Given I am on the new "product" page with link "products/new"
    And I fill in "product[name]" with "Entulho"
    And I fill in "product[description]" with "Teste"
    And I fill in "product[price]" with "-1"
    When I press "commit"
    Then I should see the message "Preço do produto deve ser maior ou igual a zero!"
