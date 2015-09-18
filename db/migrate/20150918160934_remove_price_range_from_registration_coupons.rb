class RemovePriceRangeFromRegistrationCoupons < ActiveRecord::Migration
  def change
    remove_column :registration_coupons, :price_range, :integer
  end
end
