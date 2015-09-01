class AddIndexToDiscounts < ActiveRecord::Migration
  def change
    add_index :discounts, :code, unique: true
  end
end
