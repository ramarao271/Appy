class CreateCustomTailoringShoppeds < ActiveRecord::Migration
  def change
    create_table :custom_tailoring_shoppeds do |t|
      t.string :preset_name
      t.integer :front_neck_style_value
      t.integer :back_neck_style_value
      t.integer :sleeve_style_value
      t.string :front_neck_style_name
      t.string :back_neck_style_name
      t.string :sleeve_style_name
      t.string :fitting
      t.string :blouse_opening
      t.boolean :fall_and_edging
      t.boolean :lining
      t.boolean :petticoat_inskirt
      t.float :around_bust
      t.float :shoulder
      t.float :natural_waist
      t.float :around_arm_hole
      t.float :around_arm
      t.float :your_height
      t.float :front_neck_depth
      t.float :back_neck_depth
      t.float :sleeve_length
      t.float :blouse_length
      t.decimal :product_id
      t.string :product_name
      t.decimal :customer_id

      t.timestamps null: false
    end
  end
end
