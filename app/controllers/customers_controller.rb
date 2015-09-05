class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  around_filter :shopify_session
    def getDiscounts
        require "rest_client"
        require "json"
        shop=Shop.find(2)
        puts shop.to_yaml
        shop_session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        ShopifyAPI::Base.activate_session(shop_session)
        
        response = RestClient.get('https://vavarna.myshopify.com/admin/discounts.json',:'X-Shopify-Access-Token' => 'e75fb67b4b0d27a6c4b5f080600c327f')
        #response = RestClient.get('https://a0cc4ecdce555d74b7082b5e87e8afe2:673472e56ac64aff177f87903549b816@erps.myshopify.com/admin/discounts.json')
        #blob = File.read('app/controllers/discounts.json')
        @data = JSON.parse(response)
        #puts "data is "
        puts @data
        #Discount  d=ActiveSupport::JSON.decode(blob)
        #puts d.to_yaml
        #discounts = data['discounts'].map { |rd| Resident.new(rd['phone'], rd['addr']) }
    end
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @reward_setting = RewardSetting.find(1)
    #@transactions=Transaction.allwhere(:customer_id => @customer.customer_id)
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
