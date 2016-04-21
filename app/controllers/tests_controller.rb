class TestsController < ApplicationController
    around_filter :shopify_session
    def get_test
        @products = Product.all
    end    
#       @products = User.find(:all)
#     csv_string = CSV.generate do |csv|
#          csv << ["product Id", "Name", "Email","Role"]
#          @products.each do |user|
#           csv << [user.id, user.name, user.name, user.role]
#          end
#     end         
  
#   send_data csv_string,
#   :type => 'text/csv; charset=iso-8859-1; header=present',
#   :disposition => "attachment; filename=users.csv"   
    #     count=ShopifyAPI::Product.count
    # calls=count/50
    # calls=calls+1
    # i=1
    # calls.times do 
    #   products = ShopifyAPI::Product.find(:all,:params => {:limit => 250,:page => i})
    #   i=i+1
    #   pcount=0
    #   products.each do |product|
    #     pcount=pcount+1
    #     tags=product.tags
    #     price_range="0"
    #     price_array=[]
    #     productDb=Product.find_by product_id: product.id
    #     if productDb.nil?
    #       productDb=Product.new
    #     end  
    #     productDb.product_id=product.id
    #     productDb.title=product.title
    #     productDb.vendor=product.vendor
    #     productDb.save
    #     #puts product.variants.to_yaml
    #     #arr.map! {|item| item * 3}
    #     product.variants.each do |variant|
    #       price=variant.price.to_i
    #       range_count=0
    #       range_value=0
    #     while range_count <= 20
    #       range_value2=range_value+10
    #       if price > range_value && price < range_value2 
    #         price_range="price-"+range_value.to_s+"-"+range_value2.to_s
    #       end
    #       range_count=range_count+1
    #       range_value=range_value+10
    #     end
        
    #     if price_range!="0"
    #       price_array.push(price_range)
    #     end
    #       variantDb=Variant.find_by variant_id: variant.id
    #       if variantDb.nil?
    #         variantDb=Variant.new
    #       end
    #       variantDb.variant_id=variant.id
    #       variantDb.product_id=variant.product_id
    #       variantDb.title=variant.title
    #       variantDb.price=variant.price
    #       variantDb.save
    #     end
    #     puts "tags are"
    #     puts tags
    #     tags_array=tags.split(",")
    #     tags=""
    #     tags_array.each do |tg|
    #       if !tg.include? "price-"
    #         tags=tags+","+tg
    #       end  
    #     end
    #     price_range=price_array.join(",")
    #     product.tags=tags+","+price_range
    #     puts "tags for product  "
    #     puts pcount
    #     puts product.tags
    #     sleep 1
    #     product.save
    #     # if pcount >50
    #     #   return
    #     # end
    #   end
    # end
    # redirect_to '/products/'
    #     # shop=Shop.first
        # shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        # #puts shop_session.to_yaml
        # ShopifyAPI::Base.activate_session(shop_session)
        # count=ShopifyAPI::Customer.count
        # calls=count/50
        # calls=calls+1
        # i=1
        # calls.times do 
        #     customers = ShopifyAPI::Customer.find(:all,:params => {:limit => 250,:page => i})
        #     i=i+1
        #     #count=0
        #     customers.each do |customer|
        #         refer_note=nil
        #         if !customer.note.nil?
        #             #puts "customer has note #{customer.note}"
        #             notes=customer.note.split("\n")
        #             notes.delete_if{|e| e.length == 0}
        #             notes.each do |note|
        #                 #puts "customer has note #{note}"
        #                 if note.include? "referrer"
        #                     refer_note=note.split("referrer: ")[1]
        #                     referrer=Customer.find_by customer_id: refer_note
        #                     if !referrer.nil?
        #                         #puts "#{customer.email} referred by #{referrer.email}"
        #                         #count=count+1
        #                         customer_refer_email=CustomerReferEmail.new
        #                         customer_refer_email.refer_email=customer.email
        #                         customer_refer_email.referee_id=customer.id.to_s
        #                         customer_refer_email.medium="Pre-Launch"
        #                         if customer.state=="enabled"
        #                             customer_refer_email.status="REGISTERED"
        #                         else
        #                             customer_refer_email.status="REFERRED"  
        #                         end    
        #                         referrer.customer_refer_emails << customer_refer_email
        #                     end
        #                 end
        #             end    
        #         end    
        #     end
        #     #puts "total count is #{count}"
        # end    
        # # customers=Customer.all
        # # customers.each do | customer |
            
        # # end
    # end
    def test
    end
end