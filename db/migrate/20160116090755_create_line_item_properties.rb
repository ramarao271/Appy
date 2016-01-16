class CreateLineItemProperties < ActiveRecord::Migration
  def change
    create_table :line_item_properties do |t|
      t.string :name
      t.string :value
      t.integer :line_item_id

      t.timestamps null: false
    end
  end
end
