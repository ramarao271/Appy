json.array!(@premium_reward_settings) do |premium_reward_setting|
  json.extract! premium_reward_setting, :id, :points_for_registration, :min_purchase_amount_earn_points, :points_earn_for_min_amount, :min_points_to_redeem, :amount_for_min_redeem_points, :points_for_referral, :coupon_validity, :minimum_purchase_amount, :maximum_points_to_redeem, :minmum_purchase_amount_for_refer, :referee_premium_membership_validity
  json.url premium_reward_setting_url(premium_reward_setting, format: :json)
end
