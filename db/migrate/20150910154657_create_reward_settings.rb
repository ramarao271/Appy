class CreateRewardSettings < ActiveRecord::Migration
  def change
    create_table :reward_settings do |t|
      t.integer :points_for_registration
      t.integer :min_purchase_amount_earn_points
      t.integer :points_earn_for_min_amount
      t.integer :min_points_to_redeem
      t.integer :amount_for_min_redeem_points
      t.integer :points_for_referral

      t.timestamps null: false
    end
  end
end
