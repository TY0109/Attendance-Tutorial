FactoryBot.define do
  factory :user do
    name { 'person' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end