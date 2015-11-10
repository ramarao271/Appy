class CustomTailoringShoppedsController < ApplicationController
  before_action :set_custom_tailoring_shopped, only: [:show, :edit, :update, :destroy]

  # GET /custom_tailoring_shoppeds
  # GET /custom_tailoring_shoppeds.json
  def index
    @custom_tailoring_shoppeds = CustomTailoringShopped.all
  end

  # GET /custom_tailoring_shoppeds/1
  # GET /custom_tailoring_shoppeds/1.json
  def show
  end

  # GET /custom_tailoring_shoppeds/new
  def new
    @custom_tailoring_shopped = CustomTailoringShopped.new
  end

  # GET /custom_tailoring_shoppeds/1/edit
  def edit
  end

  # POST /custom_tailoring_shoppeds
  # POST /custom_tailoring_shoppeds.json
  def create
    @custom_tailoring_shopped = CustomTailoringShopped.new(custom_tailoring_shopped_params)

    respond_to do |format|
      if @custom_tailoring_shopped.save
        format.html { redirect_to @custom_tailoring_shopped, notice: 'Custom tailoring shopped was successfully created.' }
        format.json { render :show, status: :created, location: @custom_tailoring_shopped }
      else
        format.html { render :new }
        format.json { render json: @custom_tailoring_shopped.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_tailoring_shoppeds/1
  # PATCH/PUT /custom_tailoring_shoppeds/1.json
  def update
    respond_to do |format|
      if @custom_tailoring_shopped.update(custom_tailoring_shopped_params)
        format.html { redirect_to @custom_tailoring_shopped, notice: 'Custom tailoring shopped was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_tailoring_shopped }
      else
        format.html { render :edit }
        format.json { render json: @custom_tailoring_shopped.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_tailoring_shoppeds/1
  # DELETE /custom_tailoring_shoppeds/1.json
  def destroy
    @custom_tailoring_shopped.destroy
    respond_to do |format|
      format.html { redirect_to custom_tailoring_shoppeds_url, notice: 'Custom tailoring shopped was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_tailoring_shopped
      @custom_tailoring_shopped = CustomTailoringShopped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_tailoring_shopped_params
      params.require(:custom_tailoring_shopped).permit(:preset_name, :front_neck_style_value, :back_neck_style_value, :sleeve_style_value, :front_neck_style_name, :back_neck_style_name, :sleeve_style_name, :fitting, :blouse_opening, :fall_and_edging, :lining, :petticoat_inskirt, :around_bust, :shoulder, :natural_waist, :around_arm_hole, :around_arm, :your_height, :front_neck_depth, :back_neck_depth, :sleeve_length, :blouse_length, :product_id, :product_name, :customer_id)
    end
end
