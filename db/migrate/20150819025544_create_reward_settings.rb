class CreateRewardSettings < ActiveRecord::Migration
  def change
    create_table :reward_settings do |t|
      t.string :points_for_registration
      t.string :minium_purchase_amount_earn_points
      t.string :points_earn_for_minimum_amount
      t.string :minimum_points_to_redeem
      t.string :amount_for_minimum_redeem_points

      t.timestamps null: false
    end
  end
end
