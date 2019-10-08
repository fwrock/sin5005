Feature: Categories management
  In order to manage my categories
  As a system's user
  I want to be able to manage the categories registration
  
  Scenario: The user should be able to update an existing category
    Given I am on the categories page
    When I clicked on "Editar" link
    And I fill in "category_name" with "Residuos perigosos"
    And I fill in "category_description" with "tintas, vernizes e solventes"
    When I press "Salvar"
    Then I should see "Categoria alterada com sucesso!"
