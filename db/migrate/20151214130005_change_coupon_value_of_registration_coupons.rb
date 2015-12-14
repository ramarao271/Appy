class ChangeCouponValueOfRegistrationCoupons < ActiveRecord::Migration
  def change
    change_column :registration_coupons, :coupon_value, :string
  end
end
