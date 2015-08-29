class AddDetailsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :details, :string
  end
end
