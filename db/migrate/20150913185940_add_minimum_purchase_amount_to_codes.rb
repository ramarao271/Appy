class AddMinimumPurchaseAmountToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :minimum_purchase_amount, :integer
  end
end
