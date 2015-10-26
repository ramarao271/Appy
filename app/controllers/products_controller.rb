class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  around_filter :shopify_session
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def getProductsByTitle
    @product=Product.where("product_id like ?", params[:title])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def getProducts
    products = ShopifyAPI::Product.find(:all)
    products.each do |product|
      productDb=Product.find_by product_id: product.id
      if productDb.nil?
        productDb=Product.new
      end  
      productDb.product_id=product.id
      productDb.title=product.title
      productDb.vendor=product.vendor
      
      productDb.save
      puts product.variants.to_yaml
      product.variants.each do |variant|
        variantDb=Variant.find_by variant_id: variant.id
        if variantDb.nil?
          variantDb=Variant.new
        end
        variantDb.variant_id=variant.id
        variantDb.product_id=variant.product_id
        variantDb.title=variant.title
        variantDb.price=variant.price
        variantDb.save
      end
    end
    redirect_to '/products/'
  end
  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_id, :title, :vendor)
    end
end
