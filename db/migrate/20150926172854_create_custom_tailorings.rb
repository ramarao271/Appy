class CreateCustomTailorings < ActiveRecord::Migration
  def change
    create_table :custom_tailorings do |t|
      t.boolean :regular_fit
      t.boolean :comfort_fit
      t.integer :around_bust
      t.integer :around_above_waist
      t.integer :shoulder
      t.integer :around_arm_hole
      t.integer :around_arm
      t.string :your_height
      t.string :measurement_unit
      t.string :front_neck_style
      t.integer :front_neck_depth
      t.string :back_neck_style
      t.integer :back_neck_depth
      t.string :sleeve_style
      t.integer :sleeve_length
      t.integer :blouse_length
      t.string :closing_side
      t.string :closing_with
      t.boolean :lining
      t.string :adornment_placement
      t.string :adornment_type

      t.timestamps null: false
    end
  end
end
