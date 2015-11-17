class RewardpointsController < ApplicationController
before_filter :verify_webhook, :except => ['verify_webhook']
require 'discount_Module'
include Discount_Module  
  
    def customerCreate
        data = ActiveSupport::JSON.decode(request.body.read)
        @customer = data#ShopifyAPI::Customer.find(data["id"])
        @reward_setting=RewardSetting.find(1)
        refer_note=nil
        account_type=Constants.STANDARD
        validity_date=nil
        account_authorised=false
        medium=nil
        if !@customer["note"].nil?
            puts "customer has notes"
            if @customer["note"].length >0 
                notes=@customer["note"].split("\n")
                notes.delete_if{|e| e.length == 0}
                notes.each do |note|
                    puts "customer has note #{note}"
                    if note.include? "referrer"
                        refer_note=note.split("referrer: ")[1]
                        account_type=Constants.PREMIUM
                        require 'active_support/core_ext'
                        validity_date=Date.today+@reward_setting.referee_premium_membership_validity.days
                        account_authorised=true
                    elsif note.include? "account_type"
                        account_type=note.split("account_type: ")[1]
                    elsif note.include? "premium_account_type"
                        account_type=note.split("premium_account_type: ")[1]                            
                    elsif note.include? "medium: "
                        medium=note.split("medium: ")[1]
                    end
                end
            end
        end
        require 'securerandom'
        customerId=@customer["id"].to_s
        referrerCode=customerId[6,customerId.length]+SecureRandom.base64(3).delete('/+=')[0, 3]
        @registration_setting=RegistrationSetting.find(1)
        if @registration_setting.use_coupons?
            puts "use coupons on registration"
            customerDb=Customer.create(:customer_id => @customer["id"],:first_name => @customer["first_name"], :last_name => @customer["last_name"], :reward_points_gained => 0, :reward_points_redeemed => 0,:reward_points_balance => 0, :referral_count => 0,:referral_amount => 0,:orders_count =>0,:orders_amount => 0,:referrer => refer_note,:refer_code => referrerCode,:email => @customer["email"],:account_type => account_type,:account_authorised => account_authorised,:validity_date => validity_date)
            customerDb.save
            date=Date.today
            if !@registration_setting.registration_coupons.nil?
                puts "in registration coupons with length #{@registration_setting.registration_coupons.length}"
                if @registration_setting.registration_coupons.length>1
                    @registration_setting.registration_coupons.each do |registration_coupon|
                        coupon=getCoupon(registration_coupon.coupon_value,@registration_setting.Validity_of_coupon,"IGER","NEW",date)                                
                        if !coupon.nil?
                            puts "Found coupon: #{coupon.coupon_code}"
                            coupon.status="ASSIGNED"
                            coupon.customer_id=customerDb.customer_id
                            #coupon.save
                            transactionDb=Transaction.new(:customer_id => @customer["id"],:transaction_type => Constants.new_registration,:amount => coupon.coupon_value, :coupoun_id => coupon.id,:discount_amount => coupon.coupon_value,:points => 0,:order_id => 0,:details => customerDb.account_type)
                            #transactionDb.save
                            customerDb.transactions << transactionDb
                            customerDb.codes << coupon
                        else
                            puts "Coupon for Rs. #{registration_coupon.coupon_value} not found"
                            missed_coupon=MissedCoupon.create(:coupon_value =>registration_coupon.coupon_value, :coupon_validity => @registration_setting.Validity_of_coupon, :coupon_for => "IGER", :Identified_at => date, :current_status => "NOT_CREATED", :updated_customer => false, :customer_id => customerDb.customer_id, :coupoun_id => 0)
                            missed_coupon.save
                        end    
                    end    
                elsif @registration_setting.registration_coupons.length==1
                    coupon=getCoupon(@registration_setting.registration_coupons.first.coupon_value,@registration_setting.Validity_of_coupon,"IGER","NEW",date)        
                    puts "Single Coupon for Rs. #{@registration_setting.registration_coupons.first.coupon_value} not found"
                    if coupon.nil?
                        missed_coupon=MissedCoupon.create(:coupon_value =>@registration_setting.registration_coupons.first.coupon_value, :coupon_validity => @registration_setting.Validity_of_coupon, :coupon_for => "IGER", :Identified_at => date, :current_status => "NOT_CREATED", :updated_customer => false, :customer_id => customerDb.customer_id, :coupoun_id => 0)
                        missed_coupon.save
                    else 
                        puts "Found coupon: #{coupon.coupon_code}"
                        coupon.status="ASSIGNED"
                        coupon.customer_id=customerDb.customer_id
                        transactionDb=Transaction.new(:customer_id => @customer["id"],:transaction_type => Constants.new_registration,:amount => coupon.coupon_value, :coupoun_id => coupon.id,:discount_amount => coupon.coupon_value,:points => 0,:order_id => 0,:details => customerDb.account_type)
                        #coupon.save
                        customerDb.transactions << transactionDb
                        customerDb.codes << coupon
                    end    
                end
            end    
        else
            customerDb=Customer.create(:customer_id => @customer["id"],:first_name => @customer["first_name"], :last_name => @customer["last_name"], :reward_points_gained => @reward_setting.points_for_registration, :reward_points_redeemed => 0,:reward_points_balance => @reward_setting.points_for_registration, :referral_count => 0,:referral_amount => 0,:orders_count =>0,:orders_amount => 0,:referrer => refer_note,:refer_code => referrerCode,:email => @customer["email"],:account_type => account_type,:account_authorised => account_authorised,:validity_date => validity_date)
            customerDb.save
            transactionDb=Transaction.new(:customer_id => @customer["id"],:transaction_type => Constants.new_registration,:amount => 0, :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_registration,:order_id => 0,:details => customerDb.account_type)
            #transactionDb.save
            customerDb.transactions << transactionDb
        end
        if !refer_note.nil?
            referrer=Customer.find_by customer_id: refer_note
            customer_refer_email=CustomerReferEmail.new
            customer_refer_email.refer_email=customerDb.email
            customer_refer_email.referee_id=customerDb.customer_id
            customer_refer_email.medium=medium
            customer_refer_email.status="REGISTERED"
            referrer.customer_refer_emails << customer_refer_email
        end
    end
    
    def orderCreate
        # shop=Shop.first
        # shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        # ShopifyAPI::Base.activate_session(shop_session)
        # @order = ShopifyAPI::Order.find(1374064964)
        data = ActiveSupport::JSON.decode(request.body.read)
        dbOrder=Order.find_by order_id: data["id"]
        if dbOrder.nil?
            puts "order not found in DB"
            @order = data#ShopifyAPI::Order.find(data["id"])
            dbOrder=Order.new(:order_id => @order["id"], :email => @order["email"], :total_line_items_price => @order["total_line_items_price"])
            dbOrder.save
            line_items=@order["line_items"]
            tailoring_for=nil;
            preset_name=nil;
            line_items.each do |line_item|
                if !line_item["properties"].nil? && line_item["properties"].length>0
                    puts "line items have properties"
                    line_item["properties"].each do |property|
                        puts property["name"]
                        if property["name"] == "Tailoring for "
                            tailoring_for=property["value"]
                        elsif property["name"] == "Preset Name "
                            preset_name=property["value"]
                        end
                        if !preset_name.nil?
                            puts "line item contains preset #{preset_name}"
                            customTailoring=CustomTailoring.find_by preset_name: preset_name
                            customTailoringShopped=prepareCTS(customTailoring,line_item)
                            dbOrder.customTailoringShoppeds << customTailoringShopped
                            dbOrder.save
                        end
                    end
                end
            end

            customerEmail=@order["email"]
            customer=Customer.find_by email: customerEmail
            dcode=@order["discount_codes"]
            if !dcode.nil? && !dcode[0].nil?
                puts "Used coupon code #{dcode[0]["code"]}"
                codeDB=Code.find_by coupon_code: dcode[0]["code"]
                if !codeDB.nil?
                    codeDB.status="USED"
                    codeDB.times_used=1
                    codeDB.save
                    transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.purchased,:amount => @order["total_price"], :coupoun_id => codeDB.id,:discount_amount => codeDB.coupon_value,:points => 0,:order_id => @order["id"],:details => customer.account_type )
                end    
            else
                if customer.account_type == Constants.CLUB_SILK_MEMBER
                    @reward_setting=PremiumRewardSetting.find(1)
                else
                    @reward_setting=RewardSetting.find(1)
                end  
                if @order["total_line_items_price"].to_i >= @reward_setting.min_purchase_amount_earn_points
                    puts "order amount qualifies reward points criteria"
                    puts "customer membership is #{customer.account_type}"
                    points=@reward_setting.points_earn_for_min_amount*@order["total_line_items_price"].to_i/@reward_setting.min_purchase_amount_earn_points
                    puts "Gained :#{points} points"
                    customer.reward_points_balance=customer.reward_points_balance + points.to_i
                    customer.reward_points_gained=customer.reward_points_gained + points.to_i
                    customer.orders_count=customer.orders_count+1
                    customer.save
                    transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.purchased,:amount => @order["total_price"], :coupoun_id => 0,:discount_amount => 0,:points => points.to_i,:order_id => @order["id"],:details => customer.account_type )
                    customer.transactions << transactionDb
                end    
            end
            if !customer.referrer.nil?
                puts "customer registered through referer"
                referrer=Customer.find_by customer_id: customer.referrer
                if customer.orders_count == 1
                    referrer.reward_points_balance=referrer.reward_points_balance+@reward_setting.points_for_referral
                    referrer.reward_points_gained=referrer.reward_points_gained+@reward_setting.points_for_referral
                    referrer.referral_count=referrer.referral_count+1
                    referrer.save
                    puts "referer got #{@reward_setting.points_for_referral}"
                    transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.referred,:amount => @order["total_price"], :coupoun_id => 0,:discount_amount => 0,:points => @reward_setting.points_for_referral,:order_id => @order["id"],:details => customer.account_type)        
                    referrer.transactions << transactionDb
                end
                referrer.customer_refer_emails.each do |refer|
                    if refer.refer_email == customer.email
                        refer.status="PURCHASED"
                        refer.save
                    end    
                end
            end
        end 
    end
    
    def verify_webhook
        shop=Shop.first
        data = request.body.read.to_s
        hmac_header = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
        #puts "from url"
        #puts hmac_header
        digest  = OpenSSL::Digest.new('sha256')
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, "67378b0114cdf47b30f53947b606b52c", data)).strip
        #puts "calculated_hmac is"
        #puts calculated_hmac
        #puts digest.to_yaml
        unless calculated_hmac == hmac_header
            head :unauthorized
        end
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        #puts shop_session.to_yaml
        ShopifyAPI::Base.activate_session(shop_session)
        request.body.rewind
    end
end    