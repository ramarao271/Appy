class EncashSettingsController < ApplicationController
  before_action :set_encash_setting, only: [:show, :edit, :update, :destroy]

  # GET /encash_settings
  # GET /encash_settings.json
  def index
    @encash_settings = EncashSetting.all
  end

  # GET /encash_settings/1
  # GET /encash_settings/1.json
  def show
  end

  # GET /encash_settings/new
  def new
    @encash_setting = EncashSetting.new
  end

  # GET /encash_settings/1/edit
  def edit
  end

  # POST /encash_settings
  # POST /encash_settings.json
  def create
    @encash_setting = EncashSetting.new(encash_setting_params)

    respond_to do |format|
      if @encash_setting.save
        format.html { redirect_to @encash_setting, notice: 'Encash setting was successfully created.' }
        format.json { render :show, status: :created, location: @encash_setting }
      else
        format.html { render :new }
        format.json { render json: @encash_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encash_settings/1
  # PATCH/PUT /encash_settings/1.json
  def update
    respond_to do |format|
      if @encash_setting.update(encash_setting_params)
        format.html { redirect_to @encash_setting, notice: 'Encash setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @encash_setting }
      else
        format.html { render :edit }
        format.json { render json: @encash_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encash_settings/1
  # DELETE /encash_settings/1.json
  def destroy
    @encash_setting.destroy
    respond_to do |format|
      format.html { redirect_to encash_settings_url, notice: 'Encash setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encash_setting
      @encash_setting = EncashSetting.find_or_create_by(id:1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encash_setting_params
      params.require(:encash_setting).permit(:is_applicable_to_standard, :is_applicable_to_premium, :is_applicable_to_affiliate, :standard_account_percentage, :premium_account_percentage, :affiliate_account_percentage, :minimum_points_to_encash)
    end
end
