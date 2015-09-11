class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.string :email
      t.integer :total_line_items_price

      t.timestamps null: false
    end
  end
end
