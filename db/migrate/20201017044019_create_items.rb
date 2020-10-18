class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name                ,null: false
      t.integer :price              ,null: false
      t.text :description           ,null: false
      t.integer :user_id            ,null: false
      t.integer :category_id 
      t.integer :status_id   
      t.integer :shipping_cost_id
      t.integer :shipping_timing_id 
      t.integer :prefecture_id 
      t.timestamps
    end
  end
end
