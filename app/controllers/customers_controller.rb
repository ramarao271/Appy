class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  around_filter :shopify_session, only: [:index, :edit, :update, :destroy, :customer_orders, :set_assign_coupons]
  require 'discount_Module'
  include Discount_Module  
  
  def assign_coupons
    
  end
  
  def set_assign_coupons
    customers=params[:customers].split(",")
    puts "total customers #{customers.length}"
    if customers.length >0
      customers.each { |customer|
        code=Code.create(:status => "ASSIGNED",:coupon_code => params[:coupon_code],:coupon_value => params[:coupon_value],:end_date => params[:end_date],:minimum_purchase_amount => params[:minimum_purchase_amount])
        customerDb=Customer.where("email=? and shop=?", customer,@shop_session.url).first
        if !customerDb.nil?
            customerDb.codes << code
        end    
      }
    else
      code=Code.create(:status => "ASSIGNED",:coupon_code => params[:coupon_code],:coupon_value => params[:coupon_value],:end_date => params[:end_date],:minimum_purchase_amount => params[:minimum_purchase_amount])
      customerDb=Customer.where("email=? and shop=?", customer,@shop_session.url).first
      if !customerDb.nil?
            customerDb.codes << code
      end    
    end
  end
  
  def checkCustomerGet
    @customer=Customer.where("email=? and shop=?",params[:email],params[:shop]).first
    @response="OLD_USER"
    if @customer.nil?
      shop=Shop.find_by_shopify_domain(params[:shop])
      shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
      ShopifyAPI::Base.activate_session(shop_session)
      @customer=ShopifyAPI::Customer.search(query: "email:#{params[:email]}")
      puts @customer.to_yaml
      if @customer.nil?
        @response="NEW_USER"
      end   
    end
    puts @response
    render json: @customer
  end
  
  def checkCustomer
    @customer=Customer.where("email=?",params[:email]).first
    @response="OLD_USER"
    if @customer.nil?
      @customer=ShopifyAPI::Customer.where("email=?",params[:email])
      if @customer.nil?
        @response="NEW_USER"
      end
    end
  end
  
  def redeem
    points=params[:points].to_i
    shop=Shop.find_by_shopify_domain(params[:shop])
    customer=Customer.where("customer_id=? and shop=?", params[:customer_id],params[:shop]).first
    if customer.account_type == Constants.CLUB_SILK_MEMBER
      @reward_setting = PremiumRewardSetting.find(shop.id)
    else
      @reward_setting = RewardSetting.find(shop.id)
    end
    if points%@reward_setting.unit_reward_points_to_redeem != 0
      render :json => {'message' => "points should be in multpiles of #{@reward_setting.unit_reward_points_to_redeem}",'status'=>'error'}  
      return
    end
    if customer.reward_points_balance < points 
      render :json => {'message' => "You don't have enough points to redeem",'status'=>'error'}  
      return
    end
    if points>=@reward_setting.min_points_to_redeem && points <= @reward_setting.maximum_points_to_redeem
        @coupon_value=points/@reward_setting.unit_reward_points_to_redeem*@reward_setting.amount_for_min_redeem_points
        customer.reward_points_redeemed+=points
        customer.reward_points_balance-=points
        customer.save
        date=Date.today
        coupon=getCoupon(@coupon_value.to_s,@reward_setting.coupon_validity,"DEFE","NEW",date)
        if coupon.nil?
          missed_coupon=MissedCoupon.create(:coupon_value =>@coupon_value, :coupon_validity => @reward_setting.coupon_validity, :coupon_for => "DEFE", :Identified_at => date, :current_status => "NOT_CREATED", :updated_customer => false, :customer_id => customer.customer_id, :coupoun_id => 0)
          missed_coupon.save
          render :json => {'message' => "Coupons not available! You will receive coupon in email shortly",'status'=>'error'}
        else
          coupon.status="ASSIGNED"
          customer.codes << coupon
          transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.redeemed,:amount => @coupon_value, :coupoun_id => coupon.id,:discount_amount => @coupon_value,:points => points,:order_id => 0,:details => customer.account_type)
          customer.transactions << transactionDb
          #redirect_to "/customers/#{params[:customer_id]}?coupon_value=#{coupon.coupon_code}"
          render :json => {'message' => "your Coupon is #{coupon.coupon_code}",'status'=>'success' }.to_json
        end  
    else
      render :json => {'message' => "Points should be greater than #{@reward_setting.min_points_to_redeem} and less than #{@reward_setting.maximum_points_to_redeem}",'status'=>'error'}.to_json
      #redirect_to "/customers/#{params[:customer_id]}?message=Points should be > #{@reward_setting.min_points_to_redeem} and < #{@reward_setting.maximum_points_to_redeem}"  
    end
    
  end
  
  def encash
    points=params[:points].to_i
    puts "points #{points}"
    @encash_setting = EncashSetting.find(1)
    customer=Customer.find_by customer_id: params[:customer_id]
    encash_percentage=0
    if customer.account_type == Constants.STANDARD
      encash_percentage=@encash_setting.standard_account_percentage  
    elsif customer.account_type == Constants.PREMIUM
      encash_percentage=@encash_setting.premium_account_percentage
    elsif customer.account_type == Constants.AFFILIATE
      encash_percentage=@encash_setting.affiliate_account_percentage
    end
    encash_value=points*encash_percentage.to_f/100
    if customer.reward_points_encashed.nil?
      customer.reward_points_encashed=points
    else  
      customer.reward_points_encashed+=points
    end  
    customer.reward_points_balance-=points
    customer.save
    transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.encashed,:amount => encash_value, :coupoun_id => 0,:discount_amount => encash_value,:points => points,:order_id => 0,:details => customer.account_type)
    transactionDb.save
    redirect_to "/customers/#{params[:customer_id]}?encash_value=#{encash_value}"
  end

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.where("shop=?",@shop_session.url)
  end
  
  def customer_orders
    @customer=Customer.find(params[:customer])
    @orders=@customer.orders
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    shop=Shop.find_by_shopify_domain(params[:shop])
    if @customer.account_type == Constants.AFFILIATE
      @encash_setting=EncashSetting.find(shop.id)
    end
    @reward_setting = RewardSetting.find(shop.id)
    #@customer.to_yaml
    
    #Client.where("orders_count = ?", params[:orders])
    @coupons=@customer.codes
    puts "Customer coupons are: "
    puts @coupons.length
    @active_coupons=[]
    @used_coupons=[]
    @expired_coupons=[]
    date=Date.today
    @coupons.each do |coupon|
      if date > coupon.end_date
        @expired_coupons << coupon  
      elsif coupon.status=="ASSIGNED"
        @active_coupons << coupon
      elsif coupon.status=="USED"
        @used_coupons << coupon    
      end
    end
    json_hash={}
    json_hash[:customer]=@customer
    json_hash[:transactions]=@customer.transactions
    json_hash[:expired_coupons]=@expired_coupons
    json_hash[:active_coupons]=@active_coupons
    json_hash[:used_coupons]=@used_coupons
    json_hash[:refer_email]=@customer.customer_refer_emails
    counts={"facebook_registered" => 0, "facebook_purchased" => 0, "facebook_earned" => 0,"twitter_registered" => 0, "twitter_purchased" => 0, "twitter_earned" => 0,"google_registered" => 0, "google_purchased" => 0, "google_earned" => 0,"other_registered" => 0, "other_purchased" => 0, "other_earned" => 0, "summary_registered" => 0,  "summary_purchased" => 0,  "summary_earned" => 0}
    @customer.customer_refer_emails.each do | refer |
      if refer.medium =="facebook"
        if refer.status == "REGISTERED"
          counts["facebook_registered"]=counts["facebook_registered"]+1
          counts["summary_registered"]=counts["summary_registered"]+1
        elsif refer.status == "PURCHASED"
          counts["facebook_purchased"]=counts["facebook_purchased"]+1
          counts["summary_purchased"]=counts["summary_purchased"]+1
        end  
      elsif refer.medium == "twitter"
        if refer.status == "REGISTERED"
          counts["twitter_registered"]=counts["twitter_registered"]+1
          counts["summary_registered"]=counts["summary_registered"]+1
        elsif refer.status == "PURCHASED"
          counts["twitter_purchased"]=counts["twitter_purchased"]+1
          counts["summary_purchased"]=counts["summary_purchased"]+1
        end
      elsif refer.medium == "google"
        if refer.status == "REGISTERED"
          counts["google_registered"]=counts["google_registered"]+1
          counts["summary_registered"]=counts["summary_registered"]+1
        elsif refer.status == "PURCHASED"
          counts["google_purchased"]=counts["google_purchased"]+1
          counts["summary_purchased"]=counts["summary_purchased"]+1
        end  
      elsif refer.medium == "Gmail"
        if refer.status == "REGISTERED"
          counts["google_registered"]=counts["google_registered"]+1
          counts["summary_registered"]=counts["summary_registered"]+1
        elsif refer.status == "PURCHASED"
          counts["google_purchased"]=counts["google_purchased"]+1
          counts["summary_purchased"]=counts["summary_purchased"]+1
        end      
      else
        if refer.status == "REGISTERED"
          counts["other_registered"]=counts["other_registered"]+1
          counts["summary_registered"]=counts["summary_registered"]+1
        elsif refer.status == "PURCHASED"
          counts["other_purchased"]=counts["other_purchased"]+1
          counts["summary_purchased"]=counts["summary_purchased"]+1
        end
      end
    end
    @customer.transactions do |transaction|
      if Constants.purchased == transacti.transaction_type
        counts["summary_earned"]=counts["summary_earned"]+transaction.points
      end
    end
    json_hash[:counts]=counts
    if @customer.account_type == Constants.CLUB_SILK_MEMBER
      @reward_setting = PremiumRewardSetting.find(1)
    else
      @reward_setting = RewardSetting.find(1)
    end
    json_hash[:reward_setting]=@reward_setting
     render :json => json_hash.to_json
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.where("customer_id=? and shop=?", params[:id],params[:shop]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:customer_id, :first_name, :last_name, :reward_points_gained, :reward_points_redeemed, :reward_points_balance, :referral_count, :referral_amount, :orders_count, :orders_amount)
    end
    def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
