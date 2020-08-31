FactoryBot.define do
  factory :product do
    name { Faker::Types.rb_string }
    explanation { Faker::Types.rb_string }
    category { Faker::Number.between(from: 1, to: 11) }
    condition { Faker::Number.between(from: 1, to: 7) }
    postage_type { Faker::Number.between(from: 1, to: 3) }
    prefecture { Faker::Number.between(from: 1, to: 47) }
    preparation_days { Faker::Number.between(from: 1, to: 4) }
    value { Faker::Number.number(digits: 5) }
  end
end
