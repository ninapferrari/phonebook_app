FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

FactoryBot.define do
  factory :contact do
    first_name { 'John' }
    last_name { 'Doe' }
    phone { '+55119826589962' }
    notes { 'Test note' }
    association :user
  end
end
