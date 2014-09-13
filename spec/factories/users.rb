# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.disposable_email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username Faker::Name.first_name + Faker::Name.last_name
    password "MyString123123"
  end
end
