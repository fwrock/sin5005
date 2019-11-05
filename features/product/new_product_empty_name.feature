Feature: Product management
  In order to manage my products
  As a system's user (salesman)
  I want to be able to create new produtcs
  
  Scenario: The user should be able to create an new Product with empty name
    Given I am on the new "product" page with link "products/new"
    And I fill in "product[name]" with ""
    And I fill in "product[description]" with "Tintas"
    And I fill in "product[price]" with "23"
    When I press "commit"
    Then I should see the message "Nome do produto não pode ser vazio!"
