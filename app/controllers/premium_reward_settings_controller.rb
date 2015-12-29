class PremiumRewardSettingsController < ApplicationController
  before_action :set_premium_reward_setting, only: [:show, :edit, :update, :destroy]

  # GET /premium_reward_settings
  # GET /premium_reward_settings.json
  def index
    @premium_reward_settings = PremiumRewardSetting.all
  end

  # GET /premium_reward_settings/1
  # GET /premium_reward_settings/1.json
  def show
  end

  # GET /premium_reward_settings/new
  def new
    @premium_reward_setting = PremiumRewardSetting.new
  end

  # GET /premium_reward_settings/1/edit
  def edit
  end

  # POST /premium_reward_settings
  # POST /premium_reward_settings.json
  def create
    @premium_reward_setting = PremiumRewardSetting.new(premium_reward_setting_params)
    @premium_reward_setting.id=2
    respond_to do |format|
      if @premium_reward_setting.save
        format.html { redirect_to @premium_reward_setting, notice: 'Premium reward setting was successfully created.' }
        format.json { render :show, status: :created, location: @premium_reward_setting }
      else
        format.html { render :new }
        format.json { render json: @premium_reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premium_reward_settings/1
  # PATCH/PUT /premium_reward_settings/1.json
  def update
    respond_to do |format|
      if @premium_reward_setting.update(premium_reward_setting_params)
        format.html { redirect_to @premium_reward_setting, notice: 'Premium reward setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @premium_reward_setting }
      else
        format.html { render :edit }
        format.json { render json: @premium_reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premium_reward_settings/1
  # DELETE /premium_reward_settings/1.json
  def destroy
    @premium_reward_setting.destroy
    respond_to do |format|
      format.html { redirect_to premium_reward_settings_url, notice: 'Premium reward setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium_reward_setting
      @premium_reward_setting = PremiumRewardSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_reward_setting_params
      params.require(:premium_reward_setting).permit(:points_for_registration, :min_purchase_amount_earn_points, :points_earn_for_min_amount, :min_points_to_redeem, :amount_for_min_redeem_points, :points_for_referral, :coupon_validity, :minimum_purchase_amount, :maximum_points_to_redeem, :minmum_purchase_amount_for_refer, :referee_premium_membership_validity,:registration_coupons_attributes => [:id,:coupon_value,:coupon_code])
    end
end
