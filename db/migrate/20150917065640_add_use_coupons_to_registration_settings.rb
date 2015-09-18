class AddUseCouponsToRegistrationSettings < ActiveRecord::Migration
  def change
    add_column :registration_settings, :use_coupons, :boolean
  end
end
