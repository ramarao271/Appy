class ChangeProductIdOfVariants < ActiveRecord::Migration
  def change
    change_column :variants, :product_id, :decimal, USING product_id::numeric(15,0)
    change_column :variants, :product_id, :string
  end
end
