class LineItemPropertiesController < ApplicationController
  before_action :set_line_item_property, only: [:show, :edit, :update, :destroy]

  # GET /line_item_properties
  # GET /line_item_properties.json
  def index
    @line_item_properties = LineItemProperty.all
  end

  # GET /line_item_properties/1
  # GET /line_item_properties/1.json
  def show
  end

  # GET /line_item_properties/new
  def new
    @line_item_property = LineItemProperty.new
  end

  # GET /line_item_properties/1/edit
  def edit
  end

  # POST /line_item_properties
  # POST /line_item_properties.json
  def create
    @line_item_property = LineItemProperty.new(line_item_property_params)

    respond_to do |format|
      if @line_item_property.save
        format.html { redirect_to @line_item_property, notice: 'Line item property was successfully created.' }
        format.json { render :show, status: :created, location: @line_item_property }
      else
        format.html { render :new }
        format.json { render json: @line_item_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_item_properties/1
  # PATCH/PUT /line_item_properties/1.json
  def update
    respond_to do |format|
      if @line_item_property.update(line_item_property_params)
        format.html { redirect_to @line_item_property, notice: 'Line item property was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item_property }
      else
        format.html { render :edit }
        format.json { render json: @line_item_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_item_properties/1
  # DELETE /line_item_properties/1.json
  def destroy
    @line_item_property.destroy
    respond_to do |format|
      format.html { redirect_to line_item_properties_url, notice: 'Line item property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item_property
      @line_item_property = LineItemProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_property_params
      params.require(:line_item_property).permit(:name, :value, :line_item_id)
    end
end
