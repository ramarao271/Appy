json.array!(@discount_generators) do |discount_generator|
  json.extract! discount_generator, :id, :name_of_discount_campaign, :coupon_prefix, :discount_type, :no_of_coupons, :starts_at, :end_date, :coupon_for, :value
  json.url discount_generator_url(discount_generator, format: :json)
end
