class AddDetails2ToCustomTailorings < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :around_hips, :float
    add_column :custom_tailorings, :kameez_length, :float
    add_column :custom_tailorings, :salwar_length, :float
    add_column :custom_tailorings, :product_type, :string
  end
end
