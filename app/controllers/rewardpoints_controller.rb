class RewardpointsController < ApplicationController
before_filter :verify_webhook, :except => ['verify_webhook']
    def customerCreate
        @customers= ShopifyAPI::Customer.find(:all,:params => {:limit => 5})
        data = ActiveSupport::JSON.decode(request.body.read)
        @customer = ShopifyAPI::Customer.find(data["id"])
        m=Metafield.new("RewardPoints","Desc","earned","1019","integer")
        metafield=m.createMetafield()
        metafield.to_yaml
        @customer.add_metafield(metafield) 
        m=Metafield.new("RewardPoints","Desc","balance","100","integer")
        metafield=m.createMetafield()
        @customer.add_metafield(metafield) 
        m=Metafield.new("RewardPoints","Desc","used","0","integer")
        metafield=m.createMetafield()
        @customer.add_metafield(metafield) 
    end
    
    def verify_webhook
        shop=Shop.first
        data = request.body.read.to_s
        hmac_header = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
        digest  = OpenSSL::Digest::Digest.new('sha256')
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, "3ebf4330b824c33ed1a756d1c7f11e92", data)).strip
        unless calculated_hmac == hmac_header
            puts "unauthorized hi"
            puts  hmac_header
            puts calculated_hmac
            
            head :unauthorized
        end
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        ShopifyAPI::Base.activate_session(shop_session)
        request.body.rewind
    end
end