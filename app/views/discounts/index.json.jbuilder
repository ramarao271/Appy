json.array!(@discounts) do |discount|
  json.extract! discount, :id, :id, :code, :value, :ends_at, :starts_at, :status, :minimum_order_amount, :usage_limit, :applies_to_id, :applies_once, :discount_type, :applies_to_resource, :times_used
  json.url discount_url(discount, format: :json)
end
