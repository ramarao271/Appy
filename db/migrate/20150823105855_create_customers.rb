class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :first_name
      t.string :last_name
      t.integer :reward_points_gained
      t.integer :reward_points_redeemed
      t.integer :reward_points_balance
      t.integer :referral_count
      t.integer :referral_amount
      t.integer :orders_count
      t.integer :orders_amount

      t.timestamps null: false
    end
  end
end
