class ChangeCustomerIdOfCustomer < ActiveRecord::Migration
  def change
    change_column :customers, :customer_id, :decimal
  end
end
