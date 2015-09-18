json.array!(@missed_coupons) do |missed_coupon|
  json.extract! missed_coupon, :id, :coupon_value, :coupon_validity, :coupon_for, :Identified_at, :current_status, :updated_customer, :customer_id, :coupoun_id
  json.url missed_coupon_url(missed_coupon, format: :json)
end
