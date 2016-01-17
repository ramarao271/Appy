class ChangeProductIdOfVariants < ActiveRecord::Migration
  def change
    change_column :variants, :product_id, :decimal, :precision => 15, :scale => 0
    change_column :variants, :product_id, :string
  end
end
