class ChangeCustomerIdOfCustomers < ActiveRecord::Migration
  def change
    change_column :customers, :customer_id, :bigint
  end
end
