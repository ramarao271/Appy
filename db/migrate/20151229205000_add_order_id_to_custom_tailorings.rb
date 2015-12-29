class AddOrderIdToCustomTailorings < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :order_id, :integer
  end
end
