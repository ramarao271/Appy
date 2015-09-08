class Customer < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
end
