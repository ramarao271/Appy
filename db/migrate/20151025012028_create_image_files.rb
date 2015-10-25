class CreateImageFiles < ActiveRecord::Migration
  def change
    create_table :image_files do |t|
      t.string :path
      t.string :image_for
      t.float :cost
      t.string :pairs

      t.timestamps null: false
    end
  end
end
