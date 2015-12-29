class PremiumRegistrationSettingsController < ApplicationController
  before_action :set_premium_registration_setting, only: [:show, :edit, :update, :destroy]

  # GET /premium_registration_settings
  # GET /premium_registration_settings.json
  def index
    @premium_registration_settings = PremiumRegistrationSetting.all
  end

  # GET /premium_registration_settings/1
  # GET /premium_registration_settings/1.json
  def show
  end

  # GET /premium_registration_settings/new
  def new
    @premium_registration_setting = PremiumRegistrationSetting.new
  end

  # GET /premium_registration_settings/1/edit
  def edit
  end

  # POST /premium_registration_settings
  # POST /premium_registration_settings.json
  def create
    @premium_registration_setting = PremiumRegistrationSetting.new(premium_registration_setting_params)

    respond_to do |format|
      if @premium_registration_setting.save
        format.html { redirect_to @premium_registration_setting, notice: 'Premium registration setting was successfully created.' }
        format.json { render :show, status: :created, location: @premium_registration_setting }
      else
        format.html { render :new }
        format.json { render json: @premium_registration_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premium_registration_settings/1
  # PATCH/PUT /premium_registration_settings/1.json
  def update
    @premium_registration_setting.update(premium_registration_setting_params)
    if params[:handler] == "main"
      if @premium_registration_setting.use_coupons
        if @premium_registration_setting.registration_coupons.nil?
          @premium_registration_setting.No_of_Coupons.times { @premium_registration_setting.registration_coupons.build }
        else
          @premium_registration_setting.registration_coupons=[RegistrationCoupon.new]
          (@premium_registration_setting.No_of_Coupons-1).times { @premium_registration_setting.registration_coupons.build }
        end
      else
        redirect_to '/premium_registration_settings/'
      end
    elsif params[:handler] == "coupon"
      redirect_to '/premium_registration_settings/'
    end
  end

  # DELETE /premium_registration_settings/1
  # DELETE /premium_registration_settings/1.json
  def destroy
    @premium_registration_setting.destroy
    respond_to do |format|
      format.html { redirect_to premium_registration_settings_url, notice: 'Premium registration setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium_registration_setting
      @premium_registration_setting = PremiumRegistrationSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_registration_setting_params
      params.require(:premium_registration_setting).permit(:Value_of_coupon, :Validity_of_coupon, :No_of_Coupons, :No_of_times_coupon_use, :price_range_for_coupon_to_valid, :use_coupons, :shop)
    end
end
