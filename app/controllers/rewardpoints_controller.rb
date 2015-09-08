class RewardpointsController < ApplicationController
before_filter :verify_webhook, :except => ['verify_webhook']
    def customerCreate
        data = ActiveSupport::JSON.decode(request.body.read)
        @customer = ShopifyAPI::Customer.find(data["id"])
        @reward_setting=RewardSetting.find(1)
        note=nil
        if !@customer.note.nil? 
            if @customer.note.length >0 
                note=@customer.note.split("referrer: ")[1]
            end     
        end
        require 'securerandom'
        customerId=@customer.id.to_s
        referrerCode=customerId[6,customerId.length]+SecureRandom.base64(3).delete('/+=')[0, 3]
        customerDb=Customer.create(:customer_id => @customer.id,:first_name => @customer.first_name, :last_name => @customer.last_name, :reward_points_gained => @reward_setting.points_for_registration, :reward_points_redeemed => 0,:reward_points_balance => @reward_setting.points_for_registration, :referral_count => 0,:referral_amount => 0,:orders_count =>0,:orders_amount => 0,:referrer => note,:referrer_code => referrerCode)
        customerDb.save
        transactionDb=Transaction.new(:customer_id => @customer.id,:transaction_type => Constants.new_registration,:amount => 0, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_registration,:order_id => 0,:details => "Standard Account")
        transactionDb.save
        
    end
    
    def orderCreate
        data = ActiveSupport::JSON.decode(request.body.read)
        # shop=Shop.first
        # shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        # ShopifyAPI::Base.activate_session(shop_session)
        @order = ShopifyAPI::Order.find(data["id"])
        #@order = ShopifyAPI::Order.find(1292199812)
        @reward_setting=RewardSetting.find(1)
        customerEmail=@order.email
        customer=Customer.find_by email: customerEmail
        dcode=@order.discount_codes
        codeDB=Code.find_by coupon_code: dcode[0].code
        if !codeDB.nil?
            codeDB.status="USED"
            codeDB.customer_id=customer.customer_id
            codeDB.times_used=1
            codeDB.save
        elsif @order.total_line_items_price >= @reward_setting.min_purchase_amount_earn_points
            points=@reward_setting.points_earn_for_min_amount.to_i
            customer.reward_points_balance=customer.reward_points_balance + points
            customer.reward_points_gained=customer.reward_points_gained + points
            customer.orders_count=customer.orders_count+1
            customer.save
            transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.purchased,:amount => @order.total_price, :coupoun_id => 0,:discount_amount => 0,:points => points,:order_id => @order.id,:details => "Standard Account")
            transactionDb.save
            if customer.orders_count ==1
                if !customer.referrer_code?
                    referrer=Customer.find_by referrer: customer.referrer_code
                    referrer.reward_points_balance=referrer.reward_points_balance+@reward_setting.points_for_referral
                    referrer.reward_points_gained=referrer.reward_points_gained+@reward_setting.points_for_referral
                    referrer.referral_count=referrer.referral_count+1
                    transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.referred,:amount => @order.total_price, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_referral,:order_id => @order.id,:details => "Standard Account")        
                end
            end
        end    
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