class AddMinimumPurchaseAmountToDiscountGenerators < ActiveRecord::Migration
  def change
    add_column :discount_generators, :minimum_purchase_amount, :integer
  end
end
