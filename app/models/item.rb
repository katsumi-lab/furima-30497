class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_timing
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one_attached :image
  

end
