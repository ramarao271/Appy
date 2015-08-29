class RewardpointsController < ApplicationController
before_filter :verify_webhook, :except => ['verify_webhook']
    def customerCreate
        data = ActiveSupport::JSON.decode(request.body.read)
        @customer = ShopifyAPI::Customer.find(data["id"])
        @reward_setting=RewardSetting.find(1)
        #customer_id:integer first_name:string last_name:string reward_points_gained:integer reward_points_redeemed:integer reward_points_balance:integer referral_count:integer referral_amount:integer orders_count:integer orders_amount:integer
        customerDb=Customer.create(:customer_id => @customer.id,:first_name => @customer.first_name, :last_name => @customer.last_name, :reward_points_gained => @reward_setting.points_for_registration, :reward_points_redeemed => 0,:reward_points_balance => @reward_setting.points_for_registration, :referral_count => 0,:referral_amount => 0,:orders_count =>0,:orders_amount => 0)
        customerDb.save
        #customer_id:integer type:string amount:float coupoun_id:integer discount_amount:float points:integer order_id:integer
        transactionDb=Transaction.new(:customer_id => @customer.id,:transaction_type => Constants.new_registration,:amount => 0, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_registration,:order_id => 0,:details => "Standard Account")
        transactionDb.save
    end
    
    def verify_webhook
        shop=Shop.first
        data = request.body.read.to_s
        hmac_header = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
        digest  = OpenSSL::Digest::Digest.new('sha256')
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, "3ebf4330b824c33ed1a756d1c7f11e92", data)).strip
        unless calculated_hmac == hmac_header
            head :unauthorized
        end
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        ShopifyAPI::Base.activate_session(shop_session)
        request.body.rewind
    end
end