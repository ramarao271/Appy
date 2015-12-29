module Discount_Module
   def getCoupon(coupon_value,coupon_validity,coupon_type,status,date)
        coupon=Code.where("coupon_value=? AND coupon_validity>=? AND coupon_type=? AND status=? AND ? between starts_at and end_date", coupon_value,coupon_validity,coupon_type,status,date).first
        return coupon             
   end
   def create_codes(discount_generator)
       codes = []
    prefix=discount_generator.coupon_prefix
    coupon_for=discount_generator.coupon_for
    coupon_count=discount_generator.no_of_coupons
    rawcode=prefix+coupon_for
    i=1
    while i<=coupon_count do
      code=rawcode+SecureRandom.base64(4).delete('/+=')[0, 4]+i.to_s
      codes.push(code)
      i+=1
    end
    discount_generator.coupon_code=codes
    discount_generator.status="NOT_CREATED"
   end
   def prepareCTS(customTailoring,line_item)
       
   end
end