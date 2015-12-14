class ChangeProductIdOfProductDescriptions < ActiveRecord::Migration
  def change
    change_column :product_descriptions, :product_id, :decimal, :precision => 15, :scale => 0
  end
end
