class Customer < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    has_many :codes, dependent: :destroy
end
