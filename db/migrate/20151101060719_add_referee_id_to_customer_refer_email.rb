class AddRefereeIdToCustomerReferEmail < ActiveRecord::Migration
  def change
    add_column :customer_refer_emails, :referee_id, :decimal
  end
end
