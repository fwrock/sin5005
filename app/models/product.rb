class Product < ApplicationRecord 
    
    validates :name, presence: {message: "Nome do produto não pode ser vazio!"}
    validates :price, presence: true, numericality: {:greater_than_or_equal_to => 0, message: "Preço do produto dever ser maior ou igual a zero!"}
    validates :description, presence: {message: "Descrição do produto não pode ser vazia!"}
    validates :old_price, numericality: {:greater_than_or_equal_to => 0, message: "Preço antigo do produto dever ser maior ou igual a zero!"}

end