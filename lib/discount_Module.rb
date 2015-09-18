module Discount_Module
   def getCoupon(coupon_value,coupon_validity,coupon_type,status,date)
        coupon=Code.where("coupon_value=? AND coupon_validity>=? AND coupon_type=? AND status=? AND ? between starts_at and end_date", coupon_value,coupon_validity,coupon_type,status,date).first
        puts coupon.to_yaml
        return coupon             
   end
end