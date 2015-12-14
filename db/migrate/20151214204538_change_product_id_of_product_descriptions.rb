class ChangeProductIdOfProductDescriptions < ActiveRecord::Migration
  def change
    change_column :product_descriptions, :product_id, 'decimal USING CAST(product_id AS decimal)'
  end
end
