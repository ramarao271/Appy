json.array!(@encash_settings) do |encash_setting|
  json.extract! encash_setting, :id, :is_applicable_to_standard, :is_applicable_to_premium, :is_applicable_to_affiliate, :standard_account_percentage, :premium_account_percentage, :affiliate_account_percentage, :minimum_points_to_encash
  json.url encash_setting_url(encash_setting, format: :json)
end
