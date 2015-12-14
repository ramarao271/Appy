class ChangeCustomerIdOfTables < ActiveRecord::Migration
  def change
    change_column :codes, :customer_id, :string
    change_column :custom_tailorings, :customer_id, :string
    change_column :customer_refer_emails, :customer_id, :string
    change_column :missed_coupons, :customer_id, :string
    change_column :transactions, :customer_id, :string
    change_column :variants, :product_id, :string
    change_column :products, :product_id, :string
    change_column :product_descriptions, :product_id, :string
    change_column :options, :product_id, :string
    change_column :custom_tailorings, :product_id, :string
    change_column :orders, :product_id, :string
    change_column :transactions, :product_id, :string
  end
end
