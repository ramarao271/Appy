class AddMinimumPurchaseAmountToRewardSettings < ActiveRecord::Migration
  def change
    add_column :reward_settings, :minimum_purchase_amount, :integer
  end
end
