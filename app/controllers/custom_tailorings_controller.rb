class CustomTailoringsController < ApplicationController
  before_action :set_custom_tailoring, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers

  def getPresets
    @custom_tailorings=CustomTailoring.where("customer_id= ? and product_type=?", params[:customer_id],params[:product_type])
    @custom_tailoring_presets={}
    str={}
    preset=[]
    @custom_tailorings.each do |custom_tailoring|
      str[:id]=custom_tailoring.id
      str[:preset]=custom_tailoring.preset_name
      str[:petticoat_inskirt]=custom_tailoring.petticoat_inskirt
      str[:fall_and_edging]=custom_tailoring.fall_and_edging
      preset.push(str)
      str={}
    end
    @custom_tailoring_presets[:presets] = preset
    respond_to do |format|
      format.json
    end
  end

  # GET /custom_tailorings
  # GET /custom_tailorings.json
  def index
    @custom_tailorings = CustomTailoring.all
  end

  # GET /custom_tailorings/1
  # GET /custom_tailorings/1.json
  def show
    respond_to :json
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
    @custom_tailoring.save
    render :json => {'message' => "Saved"}.to_json
    # respond_to do |format|
      # if @custom_tailoring.save
      #   render :json => {'message' => "Saved"}.to_json
      #   # format.html { redirect_to params[:custom_tailoring][:url] }
      #   # # format.html { redirect_to @custom_tailoring, notice: 'Custom tailoring was successfully created.' }
      #   # format.json { render :show, status: :created, location: @custom_tailoring }
      # else
      #   format.html { render :new }
      #   format.json { render json: @custom_tailoring.errors, status: :unprocessable_entity }
      # end
    #end
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
      params.require(:custom_tailoring).permit(:preset_name, :front_neck_style, :back_neck_style, :sleeve_style, :fitting, :blouse_opening, :fall_and_edging, :lining, :petticoat_inskirt, :around_bust, :shoulder, :natural_waist, :around_arm_hole, :around_arm, :your_height, :front_neck_depth, :back_neck_depth, :sleeve_length, :blouse_length, :product_id, :product_name, :customer_id,:inskirt_length,:around_waist_size,:around_hips,:salwar_length,:kameez_length,:product_type)
    end
    def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
