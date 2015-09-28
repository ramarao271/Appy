class Product < ActiveRecord::Base
    has_many :variants 
    accepts_nested_attributes_for :variants, allow_destroy: true
    has_many :options 
    accepts_nested_attributes_for :options, allow_destroy: true
end
