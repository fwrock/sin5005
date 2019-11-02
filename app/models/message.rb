class Message < ApplicationRecord
  validates :name, presence: {message: "Nome não pode ser vazio!"}
  validates :email, presence: {message: "Email não pode ser vazio!"}
  validates :body, presence: {message: "O corpo da mensagem não pode ser vazio!"}
end
