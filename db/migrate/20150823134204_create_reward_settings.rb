class CreateRewardSettings < ActiveRecord::Migration
  def change
    create_table :reward_settings do |t|
      t.string :points_for_registration
      t.string :min_purchase_amount_earn_points
      t.string :points_earn_for_min_amount
      t.string :min_points_to_redeem
      t.string :amount_for_min_redeem_points
      t.string :points_for_referral

      t.timestamps null: false
    end
  end
end
