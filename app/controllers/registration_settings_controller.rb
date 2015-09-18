class RegistrationSettingsController < ApplicationController
  before_action :set_registration_setting, only: [:show, :edit, :update, :destroy]

  # GET /registration_settings
  # GET /registration_settings.json
  def index
    @registration_settings = RegistrationSetting.all
  end

  # GET /registration_settings/1
  # GET /registration_settings/1.json
  def show
  end

  # GET /registration_settings/new
  def new
    @registration_setting = RegistrationSetting.new
  end

  # GET /registration_settings/1/edit
  def edit
    
  end

  # POST /registration_settings
  # POST /registration_settings.json
  def create
    @registration_setting = RegistrationSetting.new(registration_setting_params)

    respond_to do |format|
      if @registration_setting.save
        format.html { redirect_to @registration_setting, notice: 'Registration setting was successfully created.' }
        format.json { render :show, status: :created, location: @registration_setting }
      else
        format.html { render :new }
        format.json { render json: @registration_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_settings/1
  # PATCH/PUT /registration_settings/1.json
  def update
    @registration_setting.update(registration_setting_params)
    if params[:handler] == "main"
      if @registration_setting.use_coupons
        if @registration_setting.registration_coupons.nil?
          @registration_setting.No_of_Coupons.times { @registration_setting.registration_coupons.build }
        else
          @registration_setting.registration_coupons=[RegistrationCoupon.new]
          (@registration_setting.No_of_Coupons-1).times { @registration_setting.registration_coupons.build }
        end
      else
        redirect_to '/registration_settings/'
      end
    elsif params[:handler] == "coupon"
      redirect_to '/registration_settings/'
    end
  end

  # DELETE /registration_settings/1
  # DELETE /registration_settings/1.json
  def destroy
    @registration_setting.destroy
    respond_to do |format|
      format.html { redirect_to registration_settings_url, notice: 'Registration setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_setting
      @registration_setting = RegistrationSetting.find_or_create_by(id:1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_setting_params
      params.require(:registration_setting).permit(:Value_of_coupon, :Validity_of_coupon, :No_of_Coupons, :No_of_times_coupon_use, :price_range_for_coupon_to_valid,:use_coupons,:registration_coupons_attributes => [:id,:coupon_value, :price_range])
    end
end
