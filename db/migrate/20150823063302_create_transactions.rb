class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :id
      t.String :type
      t.float :amount
      t.integer :coupoun_id
      t.float :discount_amount
      t.integer :points
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
