class Order < ActiveRecord::Base
    has_many :custom_tailorings
    accepts_nested_attributes_for :registration_coupons, allow_destroy: true
end
