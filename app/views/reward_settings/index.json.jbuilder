json.array!(@reward_settings) do |reward_setting|
  json.extract! reward_setting, :id, :points_for_registration, :minium_purchase_amount_earn_points, :points_earn_for_minimum_amount, :minimum_points_to_redeem, :amount_for_minimum_redeem_points
  json.url reward_setting_url(reward_setting, format: :json)
end
