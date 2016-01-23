class ChangeProductIdOfVariants < ActiveRecord::Migration
  def change
    change_column :variants, :product_id, 'decimal USING CAST(product_id AS numeric(15,0))'
    change_column :variants, :product_id, :string
  end
end
