class CreateCustomerReferEmails < ActiveRecord::Migration
  def change
    create_table :customer_refer_emails do |t|
      t.integer :customer_id
      t.string :refer_email
      t.integer :no_of_times_sent
      t.boolean :joined

      t.timestamps null: false
    end
  end
end
