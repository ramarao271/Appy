class DiscountGenerator < ActiveRecord::Base
serialize :coupon_code
has_many :codes, dependent: :destroy
end
