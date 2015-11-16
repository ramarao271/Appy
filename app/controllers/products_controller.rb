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
      pcount=0
      products.each do |product|
        pcount=pcount+1
        tags=product.tags
        price_range="0"
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
          range_count=0
          range_value=0
        while range_count <= 20
          range_value2=range_value+1000
          if price > range_value && price < range_value2 
            price_range="price-"+range_value.to_s+"-"+range_value2.to_s
          end
          range_count=range_count+1
          range_value=range_value+1000
        end
        
        if price_range!="0"
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
        tags_array=tags.split(",")
        tgs=""
        tags_array.each do |tg|
          if !tg.include? "price-"
            tags=tgs+","+tg
          end  
        end
        price_range=price_array.join(",")
        product.tags=tags+","+price_range
        puts "tags are"
        puts product.tags
        #product.save
        if pcount >50
          return
        end
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
