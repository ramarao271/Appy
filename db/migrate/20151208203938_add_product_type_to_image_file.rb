class AddProductTypeToImageFile < ActiveRecord::Migration
  def change
    add_column :image_files, :product_type, :string
  end
end
