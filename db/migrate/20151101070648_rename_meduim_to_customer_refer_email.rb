class RenameMeduimToCustomerReferEmail < ActiveRecord::Migration
  def change
    rename_column :customer_refer_emails, :meduim, :medium
  end
end
