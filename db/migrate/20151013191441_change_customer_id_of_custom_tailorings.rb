class ChangeCustomerIdOfCustomTailorings < ActiveRecord::Migration
  def change
    change_column :custom_tailorings, :customer_id, :decimal
  end
end
