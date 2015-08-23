json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :reward_points_gained, :reward_points_redeemed, :reward_points_balance, :referral_count, :referral_amount, :orders_count, :orders_amount
  json.url customer_url(customer, format: :json)
end
