FactoryBot.define do
  factory :order_delivery do
    postal_code       {'123-4567'}
    prefecture_id     { 1 }
    municipality      {'横浜市緑区'}
    address_number    { '青山1-1-1'}
    phone_number      { '09012345678' }
    order_id          { 1 }
    user_id           { 1 }
    item_id           { 1 }
    token             { 1 }
  end
end