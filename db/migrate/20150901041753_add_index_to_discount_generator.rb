class AddIndexToDiscountGenerator < ActiveRecord::Migration
  def change
    add_index :discount_generators, :name_of_discount_campaign, unique: true
  end
end
