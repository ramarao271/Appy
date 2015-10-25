json.array!(@codes) do |code|
  json.extract! code, :id, :discount_generator_id, :coupon_code, :status, :times_used, :customer_id, :end_date
  json.url code_url(code, format: :json)
end
