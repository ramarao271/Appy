class AddDetailsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :account_type, :string
    add_column :customers, :account_authorised, :boolean
    add_column :customers, :validity_date, :date
  end
end
