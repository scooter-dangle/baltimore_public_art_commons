# Read about Factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: User do
    first_name "Cat"
    last_name "Power"
    email "cat@power.com"
    password "password"
    password_confirmation "password"

    trait :admin do
      role "Admin"
    end

    trait :curator do
      role "Curgator"
    end

    trait :cataloguer do
      role "Cataloguer"
    end
  end
end
