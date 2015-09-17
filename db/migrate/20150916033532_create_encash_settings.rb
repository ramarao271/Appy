class CreateEncashSettings < ActiveRecord::Migration
  def change
    create_table :encash_settings do |t|
      t.boolean :is_applicable_to_standard
      t.boolean :is_applicable_to_premium
      t.boolean :is_applicable_to_affiliate
      t.integer :standard_account_percentage
      t.integer :premium_account_percentage
      t.integer :affiliate_account_percentage
      t.integer :minimum_points_to_encash

      t.timestamps null: false
    end
  end
end
