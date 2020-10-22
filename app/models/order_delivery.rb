class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address_number
    validates :phone_number
  end
  
  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format:{ with: /0[0-9]{1,4}-[0-9]{1,6}(-[0-9]{0,5})?/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end