class AddCouponCodesToDiscountGenerators < ActiveRecord::Migration
  def change
    add_column :discount_generators, :coupon_code, :string
  end
end
