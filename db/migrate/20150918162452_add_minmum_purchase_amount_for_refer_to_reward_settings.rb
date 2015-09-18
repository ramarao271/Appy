class AddMinmumPurchaseAmountForReferToRewardSettings < ActiveRecord::Migration
  def change
    add_column :reward_settings, :minmum_purchase_amount_for_refer, :integer
  end
end
