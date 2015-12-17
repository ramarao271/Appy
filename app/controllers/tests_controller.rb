class TestsController < ApplicationController
    def get_test
        shop=Shop.first
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        #puts shop_session.to_yaml
        ShopifyAPI::Base.activate_session(shop_session)
        customer=Customer.where("email=?","ramarao.project@gmail.com")
        customer.save
    end
    def test
    end
end