class TestsController < ApplicationController
    def get_test
        shop=Shop.first
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        #puts shop_session.to_yaml
        ShopifyAPI::Base.activate_session(shop_session)
        count=ShopifyAPI::Customer.count
        calls=count/50
        calls=calls+1
        i=1
        calls.times do 
            customers = ShopifyAPI::Customer.find(:all,:params => {:limit => 250,:page => i})
            i=i+1
            customers.each do |customer|
                customer.save
            end
        end    
    end
    def test
    end
end