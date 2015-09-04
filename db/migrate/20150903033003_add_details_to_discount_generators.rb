class AddDetailsToDiscountGenerators < ActiveRecord::Migration
  def change
    add_column :discount_generators, :minimum_order_amount, :float
    add_column :discount_generators, :usage_limit, :integer
  end
end
