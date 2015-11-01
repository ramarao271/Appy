class AddMediumToCustomerReferEmail < ActiveRecord::Migration
  def change
    add_column :customer_refer_emails, :meduim, :string
  end
end
