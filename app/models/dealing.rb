class Dealing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :address
  belongs_to :item
  belongs_to :user
end
