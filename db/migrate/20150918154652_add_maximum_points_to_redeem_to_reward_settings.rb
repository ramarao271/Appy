class AddMaximumPointsToRedeemToRewardSettings < ActiveRecord::Migration
  def change
    add_column :reward_settings, :add_maximum_points_to_redeem, :integer
  end
end
