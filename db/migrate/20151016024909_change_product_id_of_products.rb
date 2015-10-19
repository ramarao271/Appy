class ChangeProductIdOfProducts < ActiveRecord::Migration
  def change
    change_column :products, :product_id, :decimal
  end
end
