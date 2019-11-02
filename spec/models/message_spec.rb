require 'rails_helper'

RSpec.describe Message, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "Message valid" do
            message = Message.new(
                name: Faker::Name.name,
                email: Faker::Internet.email, 
                body: 'teste'
            )
            message.valid?
            expect(message).to be_valid
  end

  it 'Message name invalid' do 
            message = Message.new(
                name: nil, 
                email: Faker::Internet.email, 
                body: 'teste'
            )
            message.valid?
            expect(message.errors[:name]).to include('Nome não pode ser vazio!') 
   end

   it 'Message email invalid' do 
            message = Message.new(
                name: Faker::Name.name,
                email: nil, 
                body: 'teste'
            )
            message.valid?
            expect(message.errors[:email]).to include('Email não pode ser vazio!') 
   end

   it 'Message body invalid' do 
            message = Message.new(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                body: nil
            )
            message.valid?
            expect(message.errors[:body]).to include('O corpo da mensagem não pode ser vazio!') 
   end
end
