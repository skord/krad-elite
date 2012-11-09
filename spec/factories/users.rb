# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    password 'please'
    password_confirmation 'please'
    username 'usersname'
  end
end
