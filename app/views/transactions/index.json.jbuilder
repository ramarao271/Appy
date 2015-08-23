json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :type, :amount, :coupoun_id, :discount_amount, :points, :order_id
  json.url transaction_url(transaction, format: :json)
end
