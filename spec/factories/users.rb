FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    read_family { 'ヤマダ' }
    read_first { 'タロウ' }
    birth { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
