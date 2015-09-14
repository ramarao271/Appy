json.array!(@registration_coupons) do |registration_coupon|
  json.extract! registration_coupon, :id, :coupon_value, :price_range
  json.url registration_coupon_url(registration_coupon, format: :json)
end
