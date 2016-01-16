class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :line_item_id
      t.integer :variant_id
      t.string :variant_title
      t.integer :product_id
      t.string :title
      t.integer :quantity
      t.double :price
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
