# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    password 'please'
    password_confirmation 'please'
    provider 'github'
    uid '26522'
    username 'usersname'
    github_token '12341234'
  end
end
