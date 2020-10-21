class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address_number
    validates :phone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end
  

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, order_id: order_id, user_id: user_id, item_id:item_id)
  end
end