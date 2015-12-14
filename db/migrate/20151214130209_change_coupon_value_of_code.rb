class ChangeCouponValueOfCode < ActiveRecord::Migration
  def change
    change_column :codes, :coupon_value, :string
  end
end
