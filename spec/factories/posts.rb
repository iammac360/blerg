# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user
    title Faker::Lorem.word
    content Faker::Lorem.paragraph
  end
end
