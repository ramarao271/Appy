class CreateDiscountGenerators < ActiveRecord::Migration
  def change
    create_table :discount_generators do |t|
      t.string :name_of_discount_campaign
      t.string :coupon_prefix
      t.string :discount_type
      t.integer :no_of_coupons
      t.date :starts_at
      t.date :end_date
      t.string :coupon_for
      t.string :value

      t.timestamps null: false
    end
  end
end
