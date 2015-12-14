class ChangeProductIdstOfProductDescriptions < ActiveRecord::Migration
  def change
    change_column :product_descriptions, :product_id, :string
  end
end
