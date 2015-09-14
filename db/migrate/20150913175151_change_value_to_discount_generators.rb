class ChangeValueToDiscountGenerators < ActiveRecord::Migration
  def change
    change_column :discount_generators, :value, :integer
  end
end
