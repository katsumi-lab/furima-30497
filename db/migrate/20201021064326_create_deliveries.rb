class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code       ,null: false
      t.integer :prefecture_id    ,null: false
      t.string :municipalety      ,null: false
      t.string :address_number    ,null: false
      t.string :building_name
      t.string :phone_number      ,null: false
      t.integer :order_id         ,null: false
      t.timestamps
    end
  end
end
