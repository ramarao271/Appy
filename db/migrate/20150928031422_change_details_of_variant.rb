class ChangeDetailsOfVariant < ActiveRecord::Migration
  def change
    change_column :variants, :variant_id, :decimal
    change_column :variants, :product_id, :decimal
  end
end
