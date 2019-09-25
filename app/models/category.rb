class Category < ApplicationRecord

    validates :name, presence: true #nome da categoria
    validates :description, presence:true #descrição da categoria

end
