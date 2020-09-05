FactoryBot.define do
  factory :order_info do
    postal_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '市原市' }
    address { '五井0000-1' }
    phone_number { '09012345678' }
  end
end
