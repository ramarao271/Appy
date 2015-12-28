class RegistrationCoupon < ActiveRecord::Base
    belongs_to :registration_setting
    belongs_to :premium_registration_setting
end
