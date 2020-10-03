FactoryBot.define do
  factory :product do
    name { Faker::Types.rb_string }
    explanation { Faker::Types.rb_string }
    category_id { Faker::Number.between(from: 1, to: 11) }
    condition_id { Faker::Number.between(from: 1, to: 7) }
    postage_type_id { Faker::Number.between(from: 1, to: 3) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    preparation_days_id { Faker::Number.between(from: 1, to: 4) }
    value { Faker::Number.number(digits: 5) }
  end
end
