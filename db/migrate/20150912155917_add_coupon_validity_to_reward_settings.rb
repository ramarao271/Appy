class AddCouponValidityToRewardSettings < ActiveRecord::Migration
  def change
    add_column :reward_settings, :coupon_validity, :integer
  end
end
