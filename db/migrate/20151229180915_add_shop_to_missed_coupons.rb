class AddShopToMissedCoupons < ActiveRecord::Migration
  def change
    add_column :missed_coupons, :shop, :string
  end
end
