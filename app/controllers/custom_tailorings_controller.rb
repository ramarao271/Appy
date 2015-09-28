class CustomTailoringsController < ApplicationController
  before_action :set_custom_tailoring, only: [:show, :edit, :update, :destroy]

  # GET /custom_tailorings
  # GET /custom_tailorings.json
  def index
    @custom_tailorings = CustomTailoring.all
  end

  # GET /custom_tailorings/1
  # GET /custom_tailorings/1.json
  def show
  end

  # GET /custom_tailorings/new
  def new
    @custom_tailoring = CustomTailoring.new
  end

  # GET /custom_tailorings/1/edit
  def edit
  end

  # POST /custom_tailorings
  # POST /custom_tailorings.json
  def create
    @custom_tailoring = CustomTailoring.new(custom_tailoring_params)

    respond_to do |format|
      if @custom_tailoring.save
        format.html { redirect_to @custom_tailoring, notice: 'Custom tailoring was successfully created.' }
        format.json { render :show, status: :created, location: @custom_tailoring }
      else
        format.html { render :new }
        format.json { render json: @custom_tailoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_tailorings/1
  # PATCH/PUT /custom_tailorings/1.json
  def update
    respond_to do |format|
      if @custom_tailoring.update(custom_tailoring_params)
        format.html { redirect_to @custom_tailoring, notice: 'Custom tailoring was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_tailoring }
      else
        format.html { render :edit }
        format.json { render json: @custom_tailoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_tailorings/1
  # DELETE /custom_tailorings/1.json
  def destroy
    @custom_tailoring.destroy
    respond_to do |format|
      format.html { redirect_to custom_tailorings_url, notice: 'Custom tailoring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_tailoring
      @custom_tailoring = CustomTailoring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_tailoring_params
      params.require(:custom_tailoring).permit(:regular_fit, :comfort_fit, :around_bust, :around_above_waist, :shoulder, :around_arm_hole, :around_arm, :your_height, :measurement_unit, :front_neck_style, :front_neck_depth, :back_neck_style, :back_neck_depth, :sleeve_style, :sleeve_length, :blouse_length, :closing_side, :closing_with, :lining, :adornment_placement, :adornment_type)
    end
end
