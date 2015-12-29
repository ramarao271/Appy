class AddCouponCodeToRegistrationCoupons < ActiveRecord::Migration
  def change
    add_column :registration_coupons, :coupon_code, :string
    change_column :registration_coupons, :coupon_value, :string
  end
end
