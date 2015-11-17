class DiscountGeneratorsController < ApplicationController
  before_action :set_discount_generator, only: [:show, :edit, :update, :destroy, :generate, :created_for_shopify]
  require 'discount_Module'
  include Discount_Module  
  # GET /discount_generators
  # GET /discount_generators.json
  def index
    @discount_generators = DiscountGenerator.where(["starts_at=? or ? between starts_at and end_date", Date.today,Date.today])
  end

  # GET /discount_generators/1
  # GET /discount_generators/1.json
  def show
  end

  # GET /discount_generators/new
  def new
    @discount_generator = DiscountGenerator.new
  end

  # GET /discount_generators/1/edit
  def edit
  end

  def created_for_shopify
    @discount_generator.status="CREATED"
    @discount_generator.save
    validity=@discount_generator.end_date-@discount_generator.starts_at
    @discount_generator.coupon_code.each{|code|
      @discount_generator.codes.create(:coupon_code => code,:status => "NEW",:coupon_type => @discount_generator.coupon_for,:starts_at => @discount_generator.starts_at,:end_date => @discount_generator.end_date,:coupon_value => @discount_generator.value,:coupon_validity => validity,:minimum_purchase_amount => @discount_generator.minimum_purchase_amount)
    }
    redirect_to :action => 'index'
  end

  def generate
    @codes=@discount_generator.coupon_code
  end



  # POST /discount_generators
  # POST /discount_generators.json
  def create
    require 'securerandom' 
    @discount_generator = DiscountGenerator.new(discount_generator_params)
    create_codes(@discount_generator)
    respond_to do |format|
      if @discount_generator.save
        format.html { redirect_to @discount_generator, notice: 'Discount generator was successfully created.' }
        format.json { render :show, status: :created, location: @discount_generator }
      else
        format.html { render :new }
        format.json { render json: @discount_generator.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /discount_generators/1
  # PATCH/PUT /discount_generators/1.json
  def update
    respond_to do |format|
      if @discount_generator.update(discount_generator_params)
        create_codes(@discount_generator)
        @discount_generator.save
        format.html { redirect_to @discount_generator, notice: 'Discount generator was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_generator }
      else
        format.html { render :edit }
        format.json { render json: @discount_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_generators/1
  # DELETE /discount_generators/1.json
  def destroy
    @discount_generator.destroy
    respond_to do |format|
      format.html { redirect_to discount_generators_url, notice: 'Discount generator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_generator
      @discount_generator = DiscountGenerator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_generator_params
      params.require(:discount_generator).permit(:name_of_discount_campaign, :coupon_prefix, :discount_type, :no_of_coupons, :starts_at, :end_date, :coupon_for, :value,:minimum_purchase_amount)
    end
end
