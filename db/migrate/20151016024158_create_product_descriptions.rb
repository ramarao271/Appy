class CreateProductDescriptions < ActiveRecord::Migration
  def change
    create_table :product_descriptions do |t|
      t.string :title
      t.text :description, :limit => nil
      t.decimal :product_id

      t.timestamps null: false
    end
  end
end
