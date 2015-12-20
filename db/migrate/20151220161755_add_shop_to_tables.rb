class AddShopToTables < ActiveRecord::Migration
  def change
    add_column :affiliate_reward_settings,:shop, :string
    add_column :codes,:shop, :string
    add_column :custom_tailoring_shoppeds,:shop, :string
    change_column :custom_tailoring_shoppeds,:customer_id, :string
    change_column :custom_tailoring_shoppeds,:product_id, :string
    add_column :custom_tailorings,:shop, :string
    add_column :customer_refer_emails,:shop, :string
    add_column :customers,:shop, :string
    add_column :discount_generators,:shop, :string
    add_column :discounts,:shop, :string
    add_column :encash_settings,:shop, :string
    add_column :image_files,:shop, :string
    add_column :missed_coupons,:shop, :string
    add_column :orders,:shop, :string
    add_column :premium_accounts,:shop, :string
    add_column :premium_reward_settings,:shop, :string
    add_column :registration_coupons,:shop, :string
    add_column :registration_settings,:shop, :string
    add_column :reward_settings,:shop, :string
  end
end
