class AddDetailsToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :starts_at, :date
    add_column :codes, :end_date, :date
  end
end
