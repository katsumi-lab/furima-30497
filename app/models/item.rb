class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_timing
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  with_options inclusion: { in: [{id: 1}] } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_timing_id
  end

  validates :price, numericality: 
    {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
  validates :price, format: { with: /\A[0-9]\w*\z/ }
end



