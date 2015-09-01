class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :code
      t.float :value
      t.date :ends_at
      t.date :starts_at
      t.string :status
      t.float :minimum_order_amount
      t.string :usage_limit
      t.string :applies_to_id
      t.boolean :applies_once
      t.string :discount_type
      t.string :applies_to_resource
      t.integer :times_used
      t.date :creation_date

      t.timestamps null: false
    end
  end
end
