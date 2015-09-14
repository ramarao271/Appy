class AddRegistrationSettingIdToRegistrationCoupon < ActiveRecord::Migration
  def change
    add_column :registration_coupons, :registration_setting_id, :integer
  end
end
