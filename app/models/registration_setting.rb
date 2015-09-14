class RegistrationSetting < ActiveRecord::Base
    has_many :registration_coupons , dependent: :destroy
end
