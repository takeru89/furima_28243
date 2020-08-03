FactoryBot.define do
  factory :item do
    name                   { "腕時計" }
    introduction           { "年季の入った高級腕時計です。" }
    category_id            { 3 }
    condition_id           { 6 }
    shipping_payer_id      { 2 }
    prefecture_id          { 45 }
    shipping_within_id     { 3 }
    price                  { 100000 }
    association :user
  end
end