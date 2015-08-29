json.array!(@registration_settings) do |registration_setting|
  json.extract! registration_setting, :id, :Value_of_coupon, :Validity_of_coupon, :No_of_Coupons, :No_of_times_coupon_use, :price_range_for_coupon_to_valid
  json.url registration_setting_url(registration_setting, format: :json)
end
