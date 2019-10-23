FactoryBot.define do
    factory :product do
        name { Faker::Lorem.word }
        description { Faker::Lorem.paragraph(2) }
        price {32}
        old_price {0}
    end

    factory :invalid_product do
        name { Faker::Lorem.word }
        description { Faker::Lorem.paragraph(2) }
        price {-1}
        old_price {0}
    end
end