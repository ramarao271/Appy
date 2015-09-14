class AddCouponValueToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :coupon_value, :integer
  end
end
