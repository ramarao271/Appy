class AddReferrerCodeToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :refer_code, :string
  end
end
