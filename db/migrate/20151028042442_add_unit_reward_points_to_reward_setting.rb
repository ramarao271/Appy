class AddUnitRewardPointsToRewardSetting < ActiveRecord::Migration
  def change
    add_column :reward_settings, :unit_reward_points_to_redeem, :integer
  end
end
