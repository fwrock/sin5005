class Category < ApplicationRecord

    validates :name, presence: {message: "Nome da categoria não pode ser vazio!"}
    validates :description, presence: {message: "Descrição da categoria não pode ser vazio!"}

    belongs_to :product, class_name: "Product"

end
