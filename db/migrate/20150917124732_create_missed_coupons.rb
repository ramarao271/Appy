class CreateMissedCoupons < ActiveRecord::Migration
  def change
    create_table :missed_coupons do |t|
      t.integer :coupon_value
      t.integer :coupon_validity
      t.string :coupon_for
      t.date :Identified_at
      t.string :current_status
      t.boolean :updated_customer
      t.integer :customer_id
      t.integer :coupoun_id

      t.timestamps null: false
    end
  end
end
