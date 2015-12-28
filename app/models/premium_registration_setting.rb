class PremiumRegistrationSetting < ActiveRecord::Base
    has_many :registration_coupons 
    accepts_nested_attributes_for :registration_coupons, allow_destroy: true
end
