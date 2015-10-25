class AddImageNameToImageFiles < ActiveRecord::Migration
  def change
    add_column :image_files, :name, :string
  end
end
