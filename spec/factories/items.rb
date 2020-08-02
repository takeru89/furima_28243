FactoryBot.define do
  factory :item do
    name                   { Faker::String.random(length: 1..40) }
    introduction           { Faker::String.random(length: 1..1000) }
    category_id            { Faker::Number.within(range: 2..11) }
    condition_id           { Faker::Number.within(range: 2..7) }
    shipping_payer_id      { Faker::Number.within(range: 2..3) }
    prefecture_id          { Faker::Number.within(range: 2..48) }
    shipping_within_id     { Faker::Number.within(range: 2..4) }
    price                  { Faker::Number.within(range: 300..9999999) }
    association :user
  end
end