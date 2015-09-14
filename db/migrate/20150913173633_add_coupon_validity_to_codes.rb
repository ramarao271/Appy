class AddCouponValidityToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :coupon_validity, :integer
  end
end
