class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :id
      t.string :code
      t.float :value
      t.string :ends_at
      t.string :starts_at
      t.string :status
      t.float :minimum_order_amount
      t.string :usage_limit
      t.string :applies_to_id
      t.boolean :applies_once
      t.string :discount_type
      t.string :applies_to_resource
      t.integer :times_used

      t.timestamps null: false
    end
  end
end
