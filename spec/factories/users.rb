FactoryBot.define do
  factory :user do
    email { 'test123@test.com' }
    password { 'test12345' }
  end

  factory :user2 do
    email { 'test1234@test.com' }
    password { 'test12345' }
  end
end
