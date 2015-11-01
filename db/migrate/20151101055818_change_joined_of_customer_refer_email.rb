class ChangeJoinedOfCustomerReferEmail < ActiveRecord::Migration
  def change
    change_column :customer_refer_emails, :joined, :string
    rename_column :customer_refer_emails, :joined, :status
  end
end
