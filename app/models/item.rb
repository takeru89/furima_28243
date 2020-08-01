class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_within
  has_many_attached :images
end
