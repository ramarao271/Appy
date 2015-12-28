json.array!(@premium_registration_settings) do |premium_registration_setting|
  json.extract! premium_registration_setting, :id, :Value_of_coupon, :Validity_of_coupon, :No_of_Coupons, :No_of_times_coupon_use, :price_range_for_coupon_to_valid, :use_coupons, :shop
  json.url premium_registration_setting_url(premium_registration_setting, format: :json)
end
