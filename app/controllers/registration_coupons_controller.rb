class RegistrationCouponsController < ApplicationController
  before_action :set_registration_coupon, only: [:show, :edit, :update, :destroy]

  # GET /registration_coupons
  # GET /registration_coupons.json
  def index
    @registration_coupons = RegistrationCoupon.all
  end

  # GET /registration_coupons/1
  # GET /registration_coupons/1.json
  def show
  end

  # GET /registration_coupons/new
  def new
    @registration_coupon = RegistrationCoupon.new
  end

  # GET /registration_coupons/1/edit
  def edit
  end

  # POST /registration_coupons
  # POST /registration_coupons.json
  def create
    @registration_coupon = RegistrationCoupon.new(registration_coupon_params)

    respond_to do |format|
      if @registration_coupon.save
        format.html { redirect_to @registration_coupon, notice: 'Registration coupon was successfully created.' }
        format.json { render :show, status: :created, location: @registration_coupon }
      else
        format.html { render :new }
        format.json { render json: @registration_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_coupons/1
  # PATCH/PUT /registration_coupons/1.json
  def update
    respond_to do |format|
      if @registration_coupon.update(registration_coupon_params)
        format.html { redirect_to @registration_coupon, notice: 'Registration coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration_coupon }
      else
        format.html { render :edit }
        format.json { render json: @registration_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_coupons/1
  # DELETE /registration_coupons/1.json
  def destroy
    @registration_coupon.destroy
    respond_to do |format|
      format.html { redirect_to registration_coupons_url, notice: 'Registration coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_coupon
      @registration_coupon = RegistrationCoupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_coupon_params
      params.require(:registration_coupon).permit(:coupon_value, :price_range,:coupon_code)
    end
end
