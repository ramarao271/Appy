class ChangeCustomerIdsOfCustomers < ActiveRecord::Migration
  def change
    change_column :customers, :customer_id, :string
     change_column :products, :product_id, :string
  end
end
