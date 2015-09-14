class AddCouponTypeToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :coupon_type, :string
  end
end
