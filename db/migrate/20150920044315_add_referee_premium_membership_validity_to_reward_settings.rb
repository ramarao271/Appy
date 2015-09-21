class AddRefereepremiumMembershipValidityToRewardSettings < ActiveRecord::Migration
  def change
    add_column :reward_settings, :referee_premium_membership_validity, :integer
  end
end
