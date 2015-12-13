class AddDetails2ToCustomTailorings < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :around_hips, :double
    add_column :custom_tailorings, :kameez_length, :double
    add_column :custom_tailorings, :salwar_length, :double
    add_column :custom_tailorings, :product_type, :string
  end
end
