class AddStatusToDiscountGenerators < ActiveRecord::Migration
  def change
    add_column :discount_generators, :status, :string
  end
end
