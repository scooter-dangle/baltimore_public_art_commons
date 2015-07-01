# Read about Factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    first_name: "Cat"
    last_name: "Power"
    password: "password"
    password_confirmation: "password"
    role: 1
  end
end
