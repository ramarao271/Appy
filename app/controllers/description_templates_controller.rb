class DescriptionTemplatesController < ApplicationController
  before_action :set_description_template, only: [:show, :edit, :update, :destroy]


  def addDescriptionTemplateToProduct
    @products = Product.all
  end

  def addDt
    
  end

  # GET /description_templates
  # GET /description_templates.json
  def index
    @description_templates = DescriptionTemplate.all
  end

  # GET /description_templates/1
  # GET /description_templates/1.json
  def show
  end

  # GET /description_templates/new
  def new
    @description_template = DescriptionTemplate.new
  end

  # GET /description_templates/1/edit
  def edit
  end

  # POST /description_templates
  # POST /description_templates.json
  def create
    @description_template = DescriptionTemplate.new(description_template_params)

    respond_to do |format|
      if @description_template.save
        format.html { redirect_to @description_template, notice: 'Description template was successfully created.' }
        format.json { render :show, status: :created, location: @description_template }
      else
        format.html { render :new }
        format.json { render json: @description_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /description_templates/1
  # PATCH/PUT /description_templates/1.json
  def update
    respond_to do |format|
      if @description_template.update(description_template_params)
        format.html { redirect_to @description_template, notice: 'Description template was successfully updated.' }
        format.json { render :show, status: :ok, location: @description_template }
      else
        format.html { render :edit }
        format.json { render json: @description_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /description_templates/1
  # DELETE /description_templates/1.json
  def destroy
    @description_template.destroy
    respond_to do |format|
      format.html { redirect_to description_templates_url, notice: 'Description template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description_template
      @description_template = DescriptionTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_template_params
      params.require(:description_template).permit(:title, :description)
    end
end
