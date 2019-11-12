class Message < ApplicationRecord
  validates :name, presence: {message: "Nome não pode ser vazio!"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "Email não pode ser vazio!"}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :body, presence: {message: "O corpo da mensagem não pode ser vazio!"}
end
