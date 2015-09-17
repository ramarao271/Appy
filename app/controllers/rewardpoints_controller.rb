class RewardpointsController < ApplicationController
before_filter :verify_webhook, :except => ['verify_webhook']
    def customerCreate
        data = ActiveSupport::JSON.decode(request.body.read)
        @customer = ShopifyAPI::Customer.find(data["id"])
        @reward_setting=RewardSetting.find(1)
        refer_note=nil
        account_type=nil
        if !@customer.note.nil? 
            if @customer.note.length >0 
                notes=@customer.note.split("\n")
                notes.delete_if{|e| e.length == 0}
                notes.each do |note|
                    if note.include? "referrer"
                        refer_note=note.split("referrer: ")[1]
                    elsif note.include? "account_type"
                        account_type=note.split("account_type: ")[1]
                    end    
                end
            end
        end
        require 'securerandom'
        customerId=@customer.id.to_s
        referrerCode=customerId[6,customerId.length]+SecureRandom.base64(3).delete('/+=')[0, 3]
        customerDb=Customer.create(:customer_id => @customer.id,:first_name => @customer.first_name, :last_name => @customer.last_name, :reward_points_gained => @reward_setting.points_for_registration, :reward_points_redeemed => 0,:reward_points_balance => @reward_setting.points_for_registration, :referral_count => 0,:referral_amount => 0,:orders_count =>0,:orders_amount => 0,:referrer => refer_note,:refer_code => referrerCode,:email => @customer.email,:account_type => account_type,:account_authorised => false)
        customerDb.save
        transactionDb=Transaction.new(:customer_id => @customer.id,:transaction_type => Constants.new_registration,:amount => 0, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_registration,:order_id => 0,:details => "Standard Account")
        transactionDb.save
    end
    
    def orderCreate
        # shop=Shop.first
        # shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        # ShopifyAPI::Base.activate_session(shop_session)
        # @order = ShopifyAPI::Order.find(1374064964)
        data = ActiveSupport::JSON.decode(request.body.read)
        dbOrder=Order.find_by order_id: data["id"]
        puts "dbOrder is "
        puts dbOrder.to_yaml
        if dbOrder.nil?
            @order = ShopifyAPI::Order.find(data["id"])
            dbOrder=Order.new(:order_id => @order.id, :email => @order.email, :total_line_items_price => @order.total_line_items_price)
            dbOrder.save
            customerEmail=@order.email
            customer=Customer.find_by email: customerEmail
            @reward_setting=RewardSetting.find(1)
            dcode=@order.discount_codes
            if !dcode.nil? && !dcode[0].nil?
                codeDB=Code.find_by coupon_code: dcode[0].code
                if !codeDB.nil?
                    codeDB.status="USED"
                    codeDB.customer_id=customer.customer_id
                    codeDB.times_used=1
                    codeDB.save
                end    
            elsif @order.total_line_items_price.to_i >= @reward_setting.min_purchase_amount_earn_points
                points=@reward_setting.points_earn_for_min_amount*@order.total_line_items_price.to_i/@reward_setting.min_purchase_amount_earn_points
                customer.reward_points_balance=customer.reward_points_balance + points.to_i
                customer.reward_points_gained=customer.reward_points_gained + points.to_i
                customer.orders_count=customer.orders_count+1
                customer.save
                transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.purchased,:amount => @order.total_price, :coupoun_id => 0,:discount_amount => 0,:points => points.to_i,:order_id => @order.id,:details => "Standard Account")
                transactionDb.save
                puts "Customer refer_code is "
                puts customer.referrer
                if !customer.referrer.nil?
                    puts "orders_count is "
                    puts customer.orders_count
                    if customer.orders_count == 1
                        referrer=Customer.find_by refer_code: customer.referrer
                        puts "referrer email is "
                        puts referrer.email
                        referrer.reward_points_balance=referrer.reward_points_balance+@reward_setting.points_for_referral
                        referrer.reward_points_gained=referrer.reward_points_gained+@reward_setting.points_for_referral
                        referrer.referral_count=referrer.referral_count+1
                        referrer.save
                        transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.referred,:amount => @order.total_price, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_referral,:order_id => @order.id,:details => "Standard Account")        
                        transactionDb.save
                    end
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