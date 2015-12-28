class CreatePremiumRegistrationSettings < ActiveRecord::Migration
  def change
    create_table :premium_registration_settings do |t|
      t.integer :Value_of_coupon
      t.integer :Validity_of_coupon
      t.integer :No_of_Coupons
      t.integer :No_of_times_coupon_use
      t.integer :price_range_for_coupon_to_valid
      t.boolean :use_coupons
      t.string :shop

      t.timestamps null: false
    end
  end
end
