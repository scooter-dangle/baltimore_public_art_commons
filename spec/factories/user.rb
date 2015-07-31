# Read about Factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin, class: User do
    first_name "Cat"
    last_name "Power"
    email "cat@power.com"
    password "password"
    password_confirmation "password"
    role :admin

  end
end
