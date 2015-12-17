class ChangeRefereeIdOfCustomerReferEmails < ActiveRecord::Migration
  def change
    change_column :customer_refer_emails, :referee_id, :string
  end
end
