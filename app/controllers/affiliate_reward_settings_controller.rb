class AffiliateRewardSettingsController < ApplicationController
  before_action :set_affiliate_reward_setting, only: [:show, :edit, :update, :destroy]

  # GET /affiliate_reward_settings
  # GET /affiliate_reward_settings.json
  def index
    @affiliate_reward_settings = AffiliateRewardSetting.all
  end

  # GET /affiliate_reward_settings/1
  # GET /affiliate_reward_settings/1.json
  def show
  end

  # GET /affiliate_reward_settings/new
  def new
    @affiliate_reward_setting = AffiliateRewardSetting.new
  end

  # GET /affiliate_reward_settings/1/edit
  def edit
  end

  # POST /affiliate_reward_settings
  # POST /affiliate_reward_settings.json
  def create
    @affiliate_reward_setting = AffiliateRewardSetting.new(affiliate_reward_setting_params)

    respond_to do |format|
      if @affiliate_reward_setting.save
        format.html { redirect_to @affiliate_reward_setting, notice: 'Affiliate reward setting was successfully created.' }
        format.json { render :show, status: :created, location: @affiliate_reward_setting }
      else
        format.html { render :new }
        format.json { render json: @affiliate_reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliate_reward_settings/1
  # PATCH/PUT /affiliate_reward_settings/1.json
  def update
    respond_to do |format|
      if @affiliate_reward_setting.update(affiliate_reward_setting_params)
        format.html { redirect_to @affiliate_reward_setting, notice: 'Affiliate reward setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @affiliate_reward_setting }
      else
        format.html { render :edit }
        format.json { render json: @affiliate_reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_reward_settings/1
  # DELETE /affiliate_reward_settings/1.json
  def destroy
    @affiliate_reward_setting.destroy
    respond_to do |format|
      format.html { redirect_to affiliate_reward_settings_url, notice: 'Affiliate reward setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliate_reward_setting
      @affiliate_reward_setting = AffiliateRewardSetting.find_or_create_by(id:1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affiliate_reward_setting_params
      params.require(:affiliate_reward_setting).permit(:points_for_registration, :min_purchase_amount_earn_points, :points_earn_for_min_amount, :min_points_to_redeem, :amount_for_min_redeem_points, :points_for_referral, :coupon_validity, :minimum_purchase_amount, :maximum_points_to_redeem, :minmum_purchase_amount_for_refer, :referee_premium_membership_validity, :maximum_orders_of_referee_to_consider)
    end
end
