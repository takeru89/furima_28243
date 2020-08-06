class AddressDealing

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input numbers and include a hyphen(-)." }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank."}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
    validates :block_num, format: { with: /\A[ぁ-んァ-ン一-龥0-9０-９]+\z/, message: "is invalid. Input Japanese characters and numbers."}
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input 10 or 11 numbers with no hyphens(-)"}
  end

  def save
    dealing = Dealing.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_num: block_num, building: building, phone_num: phone_num, dealing_id: dealing.id)
  end
end