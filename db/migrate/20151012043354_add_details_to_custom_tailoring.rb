class AddDetailsToCustomTailoring < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :preset_name, :string
    add_column :custom_tailorings, :customer_id, :float
    add_index :custom_tailorings, [:customer_id,:preset_name], unique: true
    add_column :custom_tailorings, :product_id, :float
  end
end
