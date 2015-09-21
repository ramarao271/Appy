class CreatePremiumAccounts < ActiveRecord::Migration
  def change
    create_table :premium_accounts do |t|
      t.string :name
      t.integer :amount
      t.integer :validity
      t.string :description

      t.timestamps null: false
    end
  end
end
