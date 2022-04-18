FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "worker#{n}@test.com" }
    password { 'password' }
  end
end
