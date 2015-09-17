class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  #around_filter :shopify_session
  require 'discount_Module'
  include Discount_Module  
  def redeem
    points=params[:points].to_i
    if points%1000 == 0
        puts "points #{points}"
        @reward_setting = RewardSetting.find(1)
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
    end
    redirect_to "/customers/#{params[:customer_id]}?coupon_value=#{coupon.coupon_code}"
  end
  
  def encash
    points=params[:points].to_i
    puts "points #{points}"
    @encash_setting = EncashSetting.find(1)
    customer=Customer.find_by customer_id: params[:customer_id]
    encash_percentage=0
    if customer.account_type == "standard"
      encash_percentage=@encash_setting.standard_account_percentage  
    elsif customer.account_type == "premium"
      encash_percentage=@encash_setting.premium_account_percentage
    elsif customer.account_type == "affiliate"
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
    #@customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @reward_setting = RewardSetting.find(1)
    @shop=Shop.find(1)
    #Client.where("orders_count = ?", params[:orders])
    @coupons=Code.where("customer_id= ?", @customer.customer_id)
    @transactions=Transaction.where("customer_id= ?", @customer.customer_id)
    #puts @transactions.to_yaml
    #shop=Shop.first
    #puts shop.to_yaml
    #getDiscounts
    render :layout => 'custom'
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
end
