json.array!(@reward_settings) do |reward_setting|
  json.extract! reward_setting, :id, :points_for_registration, :min_purchase_amount_earn_points, :points_earn_for_min_amount, :min_points_to_redeem, :amount_for_min_redeem_points, :points_for_referral
  json.url reward_setting_url(reward_setting, format: :json)
end
