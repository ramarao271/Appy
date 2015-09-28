class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :title
      t.string :vendor

      t.timestamps null: false
    end
  end
end
