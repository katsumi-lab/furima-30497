class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_cost_id
      t.integer :shipping_timing_id
      t.integer :prefecture_id
      t.timestamps
    end
  end
end
