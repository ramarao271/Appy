class CreatePremiumRewardSettings < ActiveRecord::Migration
  def change
    create_table :premium_reward_settings do |t|
      t.integer :points_for_registration
      t.integer :min_purchase_amount_earn_points
      t.integer :points_earn_for_min_amount
      t.integer :min_points_to_redeem
      t.integer :amount_for_min_redeem_points
      t.integer :points_for_referral
      t.integer :coupon_validity
      t.integer :minimum_purchase_amount
      t.integer :maximum_points_to_redeem
      t.integer :minmum_purchase_amount_for_refer
      t.integer :referee_premium_membership_validity

      t.timestamps null: false
    end
  end
end
