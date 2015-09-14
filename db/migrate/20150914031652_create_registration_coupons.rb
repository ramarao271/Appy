class CreateRegistrationCoupons < ActiveRecord::Migration
  def change
    create_table :registration_coupons do |t|
      t.integer :coupon_value
      t.integer :price_range

      t.timestamps null: false
    end
  end
end
