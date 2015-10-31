class Customer < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    has_many :codes
    has_many :customer_refer_emails,  dependent: :destroy
end
