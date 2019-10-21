require 'rails_helper'

describe User do
    context 'Create/edit a user' do
        it "Invalid email" do
            user = User.new(
                name: Faker::Name.name, 
                email: "adilson.com",
                password: "123456677899"
            )
            user.valid?
            expect(user.errors[:email]).to include('is invalid') 
        end

        it "User password length less than 6 digits" do
            user = User.new(
                name: Faker::Name.name, 
                email: "adilson.khouri.usp@gmail.com",
                password: "123"
            )
            user.valid?
            expect(user.errors[:password]).to include('is too short (minimum is 6 characters)') 
        end

        it "User should have a name" do
            user = User.new(
                name: nil, 
                email: "adilson.khouri.usp@gmail.com",
                password: "123456788990"
            )
            user.valid?
            expect(user.errors[:name]).to include("can't be blank") 
        end

        it "User should have a name length less than 50 digits" do
            user = User.new(
                name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 
                email: "adilson.khouri.usp@gmail.com",
                password: "123456788990"
            )
            user.valid?
            puts user.valid?
            puts user.errors[:name]
            expect(user.errors[:name]).to include("is too long (maximum is 50 characters)") 
        end
    end
end