class RewardSettingsController < ApplicationController
  around_filter :shopify_session
  before_action :set_reward_setting, only: [:show, :edit, :update, :destroy]

  # GET /reward_settings
  # GET /reward_settings.json
  def index
    @reward_settings = RewardSetting.all
  end

  # GET /reward_settings/1
  # GET /reward_settings/1.json
  def show
  end

  # GET /reward_settings/new
  def new
    redirect_to '/reward_settings/1/edit'
    #@reward_setting = RewardSetting.new
    #puts ShopifyAPI::Shop.current.name
  end

  # GET /reward_settings/1/edit
  def edit
  end

  # POST /reward_settings
  # POST /reward_settings.json
  def create
    @reward_setting = RewardSetting.new(reward_setting_params)

    respond_to do |format|
      if @reward_setting.save
        metafieldStrings={"points_for_registration" => @reward_setting.points_for_registration,"min_purchase_amount_points" => @reward_setting.minium_purchase_amount_earn_points,"points_earn_for_min_amount" => @reward_setting.points_earn_for_minimum_amount,
          "min_points_to_redeem" => @reward_setting.minimum_points_to_redeem,"amount_for_min_redeem_points" => @reward_setting.amount_for_minimum_redeem_points}
          puts metafieldStrings.keys
          puts metafieldStrings.values
        metafieldStrings.each do |key,value| 
          m=Metafield.new("RewardPointsSettings","RewardPointsSettings",key,value,"integer")
          metafield=m.createMetafield()
          shop=ShopifyAPI::Shop.current
          shop.add_metafield(metafield)
           puts "shop metafields"
           shop.metafields.to_yaml
          #puts shop.metafields.RewardPointsSettings.key
          #puts shop.metafields.RewardPointsSettings.value
          puts "done"
        end
        format.html { redirect_to @reward_setting, notice: 'Reward setting was successfully created.' }
        format.json { render :show, status: :created, location: @reward_setting }
      else
        format.html { render :new }
        format.json { render json: @reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_settings/1
  # PATCH/PUT /reward_settings/1.json
  def update
    respond_to do |format|
      if @reward_setting.update(reward_setting_params)
        format.html { redirect_to @reward_setting, notice: 'Reward setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_setting }
      else
        format.html { render :edit }
        format.json { render json: @reward_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_settings/1
  # DELETE /reward_settings/1.json
  def destroy
    @reward_setting.destroy
    respond_to do |format|
      format.html { redirect_to reward_settings_url, notice: 'Reward setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_setting
      @reward_setting = RewardSetting.find_or_create_by(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_setting_params
      params.require(:reward_setting).permit(:points_for_registration, :minium_purchase_amount_earn_points, :points_earn_for_minimum_amount, :minimum_points_to_redeem, :amount_for_minimum_redeem_points)
    end
end
