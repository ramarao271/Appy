class ProductDescriptionsController < ApplicationController
  before_action :set_product_description, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  # GET /product_descriptions
  # GET /product_descriptions.json
  def index
    @product_descriptions = ProductDescription.all
  end

  # GET /product_descriptions/1
  # GET /product_descriptions/1.json
  def show
  end

  # GET /product_descriptions/new
  def new
    @product_description = ProductDescription.new
  end

  def descriptions_by_product
    @product=Product.where("product_id= ?", params[:product_id])
    @product.to_yaml
    @product_description = ProductDescription.new
    @product_descriptions=ProductDescription.where("product_id= ?", params[:product_id])
  end



  # GET /product_descriptions/1/edit
  def edit
    @product_descriptions=ProductDescription.where("product_id= ?", @product_description.product_id)
  end

  # POST /product_descriptions
  # POST /product_descriptions.json
  def create
    @product_description = ProductDescription.new(product_description_params)
    @product_description.product_id=params[:product_id]
    respond_to do |format|
      if @product_description.save
        format.html { redirect_to @product_description, notice: 'Product description was successfully created.' }
        format.json { render :show, status: :created, location: @product_description }
      else
        format.html { render :new }
        format.json { render json: @product_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_descriptions/1
  # PATCH/PUT /product_descriptions/1.json
  def update
    respond_to do |format|
      if @product_description.update(product_description_params)
        format.html { redirect_to @product_description, notice: 'Product description was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_description }
      else
        format.html { render :edit }
        format.json { render json: @product_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_descriptions/1
  # DELETE /product_descriptions/1.json
  def destroy
    @product_description.destroy
    respond_to do |format|
      format.html { redirect_to product_descriptions_url, notice: 'Product description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_description
      @product_description = ProductDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_description_params
      params.require(:product_description).permit(:title, :description, :product_id)
    end
    def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
