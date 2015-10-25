class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  def discount_code
    d=DiscountGenerator.find(params[:id])
    @codes=d.codes
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end
  
  def coupons_customer
    @coupons=Code.where("customer_id= ?", params[:customer_id])  
    @coupons.each do |transaction|
      transaction.created_at=transaction.end_date.strftime("%d-%m-%Y")
    end
  end



  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    if @code.status == "NEW" 
      @code.destroy
      
      redirect_to "/codes/#{@code.discount_generator_id}/discount_codes"
      # respond_to do |format|
      #   format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      #   format.json { head :no_content }
      # end
    else
      respond_to do |format|
        format.html { redirect_to codes_url, notice: 'Code cannot be destroyed.' }
        format.json { head :no_content }
      end
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params.require(:code).permit(:discount_generator_id, :coupon_code, :status, :times_used, :customer_id)
    end
    def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
