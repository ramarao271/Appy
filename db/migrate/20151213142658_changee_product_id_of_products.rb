class ChangeeProductIdOfProducts < ActiveRecord::Migration
  def change
    change_column :products, :product_id, :bigint
  end
end
