class AddReferrerToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :referrer, :string
  end
end
