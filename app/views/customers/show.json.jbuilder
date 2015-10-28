json.extract! @customer, :id, :customer_id, :first_name, :last_name, :reward_points_gained, :reward_points_redeemed, :reward_points_balance, :referral_count, :referral_amount, :orders_count, :orders_amount, :created_at, :updated_at,:validity_date,:account_type
json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :customer_id, :transaction_type, :amount, :coupoun_id, :discount_amount, :points, :order_id
  json.url transaction_url(transaction, format: :json)
end
