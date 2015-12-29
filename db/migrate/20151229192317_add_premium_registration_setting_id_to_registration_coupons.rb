class AddPremiumRegistrationSettingIdToRegistrationCoupons < ActiveRecord::Migration
  def change
    add_column :registration_coupons, :premium_registration_setting_id, :integer
  end
end
