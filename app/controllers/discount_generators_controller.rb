class DiscountGeneratorsController < ApplicationController
  before_action :set_discount_generator, only: [:show, :edit, :update, :destroy, :generate, :created_for_shopify]

  # GET /discount_generators
  # GET /discount_generators.json
  def index
    @discount_generators = DiscountGenerator.where(["? between starts_at and end_date", Date.today])
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
    @discount_generator.coupon_code.each{|code|
      @discount_generator.codes.create(:coupon_code => code,:status => "NEW")
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
    codes = []
    prefix=@discount_generator.coupon_prefix
    coupon_for=@discount_generator.coupon_for
    coupon_count=@discount_generator.no_of_coupons
    rawcode=prefix+coupon_for
    i=1
    while i<=coupon_count do
      code=rawcode+SecureRandom.base64(4).delete('/+=')[0, 4]+i.to_s
      codes.push(code)
      i+=1
    end
    @discount_generator.coupon_code=codes
    @discount_generator.status="NOT_CREATED"
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
      params.require(:discount_generator).permit(:name_of_discount_campaign, :coupon_prefix, :discount_type, :no_of_coupons, :starts_at, :end_date, :coupon_for, :value)
    end
end
