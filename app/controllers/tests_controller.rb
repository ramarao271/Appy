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
                refer_note=nil
                if !customer.note.nil?
                    notes=customer.note.split("\n")
                    notes.delete_if{|e| e.length == 0}
                    notes.each do |note|
                        puts "customer has note #{note}"
                        if note.include? "referrer"
                            refer_note=note.split("referrer: ")[1]
                            referrer=Customer.find_by customer_id: refer_note
                            if !referrer.nil?
                                customer_refer_email=CustomerReferEmail.new
                                customer_refer_email.refer_email=customer.email
                                customer_refer_email.referee_id=customer.customer_id.to_s
                                customer_refer_email.medium=medium
                                if customer.state=="enabled"
                                    customer_refer_email.status="REGISTERED"
                                else
                                    customer_refer_email.status="REFERRED"  
                                end    
                                referrer.customer_refer_emails << customer_refer_email
                            end
                        end
                    end    
                end    
            end
        end    
        # customers=Customer.all
        # customers.each do | customer |
            
        # end
    end
    def test
    end
end