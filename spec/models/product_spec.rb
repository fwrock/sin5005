require 'rails_helper'

describe Product do
    context 'Create/edit a produtct' do
        it "Product price less than zero" do
            product = Product.new(
                name: Faker::Name.name, 
                description: Faker::Food.description,
                price: -1,
                old_price: 0 
            )
            product.valid?
            expect(product.errors[:price]).to include('Preço do produto deve ser maior ou igual a zero!') 
        end

        it "Product old_price less than zero" do
            product = Product.new(
                name: Faker::Name.name, 
                description: Faker::Food.description,
                price: 43,
                old_price: -1 
            )
            product.valid?
            expect(product.errors[:old_price]).to include('Preço antigo do produto deve ser maior ou igual a zero!') 
        end

        it 'Product name invalid' do 
            product = Product.new(
                name: nil, 
                description: Faker::Food.description,
                price: 43,
                old_price: 0
            )
            product.valid?
            expect(product.errors[:name]).to include('Nome do produto não pode ser vazio!') 
        end

        it 'Product description invalid' do 
            product = Product.new(
                name: Faker::Name.name, 
                description: nil,
                price: 43,
                old_price: 0 
            )
            product.valid?
            expect(product.errors[:description]).to include('Descrição do produto não pode ser vazia!') 
        end

        it "Product valid" do
            product = Product.new(
                name: Faker::Name.name, 
                description: Faker::Food.description,
                price: 30,
                old_price: 23 
            )
            product.valid?
            expect(product).to be_valid
        end
    end
end