class ChangeVariantIdOfVariants < ActiveRecord::Migration
  def change
    change_column :variants, :variant_id, :decimal, :precision => 15, :scale => 0
    change_column :variants, :variant_id, :string
  end
end
