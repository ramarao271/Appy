class AddSkuToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :sku, :string
  end
end
