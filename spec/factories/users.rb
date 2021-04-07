FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    lastname { '田中' }
    firstname { '太郎' }
    lastnamekana { 'タナカ' }
    firstnamekana { 'タロウ' }
    birthday { '1990-01-01' }
  end
end
