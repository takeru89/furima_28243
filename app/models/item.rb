class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_within
  has_many_attached :images
  has_one :dealing

  with_options presence: true do
    validates :images
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id, :condition_id, :shipping_payer_id, :prefecture_id, :shipping_within_id
    end

    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
