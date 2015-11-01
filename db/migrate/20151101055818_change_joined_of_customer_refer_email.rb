class ChangeJoinedOfCustomerReferEmail < ActiveRecord::Migration
  def change
    change_column :customer_refer_email, :joined, :string
    rename_column :customer_refer_email, :joined, :status
  end
end
