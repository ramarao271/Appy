class AddShopToRegistrationSettings < ActiveRecord::Migration
  def change
    add_column :registration_settings, :shop, :string
  end
end
