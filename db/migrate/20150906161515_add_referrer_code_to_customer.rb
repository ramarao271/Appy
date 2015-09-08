class AddReferrerCodeToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :referrer_code, :string
  end
end
