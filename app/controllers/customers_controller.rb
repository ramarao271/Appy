class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  #around_filter :shopify_session
  require 'discount_Module'
  include Discount_Module  
  
  def checkCustomerGet
    @customer=Customer.where("email=?",params[:email])
    @response="OLD_USER"
    if @customer.nil?
      @customer=ShopifyAPI::Customer.where("email=?",params[:email])
      if @customer.nil?
        @response="NEW_USER"
      end   
    end
    puts @response
  end
  
  def checkCustomer
    @customer=Customer.where("email=?",params[:email])
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
    @reward_setting = RewardSetting.find(1)
    if points>@reward_setting.min_points_to_redeem && points <= @reward_setting.maximum_points_to_redeem
        @coupon_value=points/1000*@reward_setting.amount_for_min_redeem_points
        customer=Customer.find_by customer_id: params[:customer_id]
        customer.reward_points_redeemed+=points
        customer.reward_points_balance-=points
        customer.save
        date=Date.today
        coupon=getCoupon(@coupon_value,@reward_setting.coupon_validity,"DEFE","NEW",date)
        coupon.status="ASSIGNED"
        coupon.customer_id=customer.customer_id
        coupon.save
        transactionDb=Transaction.new(:customer_id => customer.customer_id,:transaction_type => Constants.redeemed,:amount => @coupon_value, :coupoun_id => 0,:discount_amount => @coupon_value,:points => points,:order_id => 0,:details => customer.account_type)
        transactionDb.save
        redirect_to "/customers/#{params[:customer_id]}?coupon_value=#{coupon.coupon_code}"
    else
      redirect_to "/customers/#{params[:customer_id]}?message=Points should be > #{@reward_setting.min_points_to_redeem} and < #{@reward_setting.maximum_points_to_redeem}"  
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
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    if @customer.account_type == Constants.AFFILIATE
      @encash_setting=EncashSetting.find(1)
    end
    @reward_setting = RewardSetting.find(1)
    @shop=Shop.find(1)
    #Client.where("orders_count = ?", params[:orders])
    @coupons=Code.where("customer_id= ?", @customer.customer_id)
    @active_coupons=[]
    @used_coupons=[]
    @expired_coupons=[]
    date=Date.today
    @coupons.each do |coupon|
      if date > coupon.end_date
        @expired_coupons << coupon  
      elsif coupon.status=="ASSIGNED"
        @active_coupons << coupon
      else
        @used_coupons << coupon    
      end
    end
    @transactions=Transaction.where("customer_id= ?", @customer.customer_id)
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
      @customer = Customer.find_by customer_id: params[:id]
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
