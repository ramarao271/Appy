class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  around_filter :shopify_session
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def getProducts
    count=ShopifyAPI::Product.count
    calls=count/50
    calls=calls+1
    i=1
    calls.times do 
      products = ShopifyAPI::Product.find(:all,:params => {:limit => 250,:page => i})
      i=i+1
      products.each do |product|
        tags=product.tags
        price_range=0
        price_array=[]
        productDb=Product.find_by product_id: product.id
        if productDb.nil?
          productDb=Product.new
        end  
        productDb.product_id=product.id
        productDb.title=product.title
        productDb.vendor=product.vendor
      
        productDb.save
        #puts product.variants.to_yaml
        #arr.map! {|item| item * 3}
        product.variants.each do |variant|
          price=variant.price.to_i
        if price < 1000
          price_range="less than 1000"
        elsif price > 1000 && price < 3000
          price_range="1000-3000"
        elsif price > 3000 && price < 6000
          price_range="3000-6000"
        elsif price > 6000 && price < 9000
          price_range="6000-9000"
        elsif price > 9000 && price < 12000
          price_range="9000-12000"  
        elsif price > 12000 && price < 15000
          price_range="12000-15000"  
        elsif price > 15000
          price_range="more than 15000"  
        end
        if price_range>0
          price_array.push(price_range)
        end
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
        puts "tags are"
        puts tags
        price_range="'#{price_array.join("','")}'"
        product.tags=tags+price_range
        puts "tags are"
        puts tags
        product.save
        return
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
