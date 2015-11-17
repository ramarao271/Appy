class MissedCouponsController < ApplicationController
  before_action :set_missed_coupon, only: [:show, :edit, :update, :destroy, :created]
  
  require 'discount_Module'
  include Discount_Module  

  def created
    coupon=getCoupon(@missed_coupon.coupon_value,@missed_coupon.coupon_validity,@missed_coupon.coupon_for,"NEW",@missed_coupon.Identified_at)                                
    if !coupon.nil?
      coupon.customer_id=@missed_coupon.customer_id
      coupon.status="ASSIGNED"
      customer=Customer.find_by customer_id: @missed_coupon.customer_id
      customer.codes << coupon
      #coupon.save
      @missed_coupon.coupoun_id=coupon.id
      @missed_coupon.current_status="CREATED"
      @missed_coupon.save
      message="Added to Customer coupons list "
    else
      message="Coupon not found! Please create it first through Discount Generator"
    end
    redirect_to "/missed_coupons?message=#{message}"
  end
  
  # GET /missed_coupons
  # GET /missed_coupons.json
  def index
    @missed_coupons = MissedCoupon.all
  end

  # GET /missed_coupons/1
  # GET /missed_coupons/1.json
  def show
  end

  # GET /missed_coupons/new
  def new
    @missed_coupon = MissedCoupon.new
  end

  # GET /missed_coupons/1/edit
  def edit
  end

  # POST /missed_coupons
  # POST /missed_coupons.json
  def create
    @missed_coupon = MissedCoupon.new(missed_coupon_params)

    respond_to do |format|
      if @missed_coupon.save
        format.html { redirect_to @missed_coupon, notice: 'Missed coupon was successfully created.' }
        format.json { render :show, status: :created, location: @missed_coupon }
      else
        format.html { render :new }
        format.json { render json: @missed_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missed_coupons/1
  # PATCH/PUT /missed_coupons/1.json
  def update
    respond_to do |format|
      if @missed_coupon.update(missed_coupon_params)
        format.html { redirect_to @missed_coupon, notice: 'Missed coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @missed_coupon }
      else
        format.html { render :edit }
        format.json { render json: @missed_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missed_coupons/1
  # DELETE /missed_coupons/1.json
  def destroy
    @missed_coupon.destroy
    respond_to do |format|
      format.html { redirect_to missed_coupons_url, notice: 'Missed coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_missed_coupon
      @missed_coupon = MissedCoupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def missed_coupon_params
      params.require(:missed_coupon).permit(:coupon_value, :coupon_validity, :coupon_for, :Identified_at, :current_status, :updated_customer, :customer_id, :coupoun_id)
    end
end
