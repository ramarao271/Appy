class ChangeAddMaximumPointsToRedeemToMaximumPointsToRedeem < ActiveRecord::Migration
  def change
    rename_column :reward_settings, :add_maximum_points_to_redeem, :maximum_points_to_redeem
  end
end
