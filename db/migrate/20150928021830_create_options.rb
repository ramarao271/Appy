class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :option_id
      t.integer :product_id
      t.string :name
      t.string :values

      t.timestamps null: false
    end
  end
end
