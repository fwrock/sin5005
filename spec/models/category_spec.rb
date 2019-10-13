require 'rails_helper'
require 'database_cleaner'

describe Category do

  it "Category valid" do
            category = Category.new(
                name: Faker::Name.name, 
                description: Faker::Food.description,
            )
            category.valid?
            expect(category).to be_valid
        end

  it 'Category name invalid' do 
            category = Category.new(
                name: nil, 
                description: Faker::Food.description,
            )
            category.valid?
            expect(category.errors[:name]).to include('Nome da categoria não pode ser vazio!') 
        end

        it 'Category description invalid' do 
            category = Category.new(
                name: Faker::Name.name, 
                description: nil,
            )
            category.valid?
            expect(category.errors[:description]).to include('Descrição da categoria não pode ser vazio!') 
        end
end
