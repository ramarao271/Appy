class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :variant_id
      t.integer :product_id
      t.string :title
      t.float :price

      t.timestamps null: false
    end
  end
end
