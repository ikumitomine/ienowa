#Fakerでユーザーを作成
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password = Faker::Internet.password(6)
    password { password }
    password_confirmation { password }
  end
end
