module Product_Module
    def create_product(product)
        tags=product["tags"]
        price_range="0"
        price_array=[]
        productDb=Product.new
        productDb.product_id=product["id"]
        productDb.title=product["title"]
        productDb.vendor=product["vendor"]
        productDb.save
        product["variants"].each do |variant|
          price=variant["price"].to_i
          range_count=0
          range_value=0
        while range_count <= 20
          range_value2=range_value+1000
          if price > range_value && price < range_value2 
            price_range="price-"+range_value.to_s+"-"+range_value2.to_s
          end
          range_count=range_count+1
          range_value=range_value+1000
        end
        
        if price_range!="0"
          price_array.push(price_range)
        end
        variantDb=Variant.new
        variantDb.variant_id=variant["id"]
        variantDb.product_id=variant["product_id"]
        variantDb.title=variant["title"]
        variantDb.price=variant["price"]
        variantDb.save
        end
        puts "tags are"
        puts tags
        tags_array=tags.split(",")
        tags=""
        tags_array.each do |tg|
          if !tg.include? "price-"
            tags=tags+","+tg
          end  
        end
        price_range=price_array.join(",")
        product.tags=tags+","+price_range
        puts "tags for product  "
        puts pcount
        puts product.tags
        sleep 2
        product.save
    end
end