class Order < ActiveRecord::Base
    has_many :custom_tailorings
    accepts_nested_attributes_for :custom_tailorings, allow_destroy: true
end
