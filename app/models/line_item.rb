class LineItem < ActiveRecord::Base
    belongs_to :order
    has_many :line_item_properties,  dependent: :destroy
end
