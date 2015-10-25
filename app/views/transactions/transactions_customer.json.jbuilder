json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :customer_id, :transaction_type, :amount, :coupoun_id, :discount_amount, :points, :order_id, :created_at
  json.url transaction_url(transaction, format: :json)
end
