class Category < ApplicationRecord

    validates :name, presence: {message: "Nome da categoria não pode ser vazio!"}
    validates :description, presence: {message: "Descrição da categoria não pode ser vazio!"}

end
