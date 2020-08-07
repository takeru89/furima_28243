FactoryBot.define do
  factory :address_dealing do
    postal_code   { '123-4567' }
    prefecture_id { 5 }
    city          { '板橋区' }
    block_num     { '板橋3-3' }
    building      { '板橋ハイツ203' }
    phone_num     { '09012345678' }
  end
end