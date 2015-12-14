class ChangeProductIdsOfProductDescriptions < ActiveRecord::Migration
  def change
    change_column :product_descriptions, :product_id, :decimal,:scale => 0
  end
end
