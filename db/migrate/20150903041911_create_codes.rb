class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :discount_generator_id
      t.string :coupon_code
      t.string :status
      t.integer :times_used
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
