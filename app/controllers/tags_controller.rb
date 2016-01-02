class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  around_filter :shopify_session
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end
  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  def create_tags
    tags_array=["Banaras Silk","Chanderi Silk","Kanchipuram Silk","Uppada Silk","Gadwal Silk","Coimbatore Silk","Venkatagiri Silk","Mysore Silk","Assam Silk","Mangalagiri Silk","Ikat Silk","Ksheerapuri Silk","Kota Silk","Crepe Silk","Faux Crepe","Chiffon","Georgette","Faux Georgette","Banaras Fancy","Kora Fancy","Art Silk","Super Net","Kota Fancy","Chanderi Fancy","Organza Silk","Organza Cotton","Kora Cotton","Bengal Cotton","Dhaka Cotton","Chanderi Cotton","Banaras Cotton","Coimbatore Cotton","Gadwal Cotton","Kanchi Cotton","Uppada Cotton","Mangalagiri Cotton"]
    #Tag.delete_all
    tags_array.each { |tag|
      
      tagDb=Tag.new
      tagDb.tag=tag
      tagDb.save
      
    }
  end


  def get_tags_from_shopify
    
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    request.session.each {|key, value| puts key.to_s + " --> " + value.to_s }
    respond_to do |format|
      if @tag.update(tag_params)
        count=ShopifyAPI::Product.count
        calls=count/50
        calls=calls+1
        puts "count is #{count}"
        i=1
        calls.times do 
          products = ShopifyAPI::Product.find(:all,:params => {:limit => 250,:page => i})
          i=i+1
          pcount=0
          products.each do |product|
            extra_tag=nil
            if product.tags.include? @tag.tag
              pcount=pcount+1
              product.variants.each do |variant|
                price=variant.price.to_i
                compare_price=price+price*@tag.percentile/100
                compare_price=25-compare_price%25+compare_price
                variant.compare_at_price=compare_price
                puts product.title
                puts variant.price
                puts variant.compare_at_price
                extra_tag="Save-"+((@tag.percentile/(100+@tag.percentile))*100).to_i.to_s
              end
              if !extra_tag.nil?
                tags=product.tags
                if !tags.include? extra_tag
                  tags_array=tags.split(",")
                  tags=""
                  tags_array.each do |tg|
                    if !tg.include? "Save-"
                      tags=tags+","+tg
                    end  
                  end
                end
              end
              product.tags=tags+","+extra_tag
              puts product.tags
              extra_tag=nil
              sleep 2
              product.save
            end
          end
        end
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end        
    end
  end
  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:tag, :percentile)
    end
end
