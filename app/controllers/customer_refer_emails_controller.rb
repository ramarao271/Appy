class CustomerReferEmailsController < ApplicationController
  before_action :set_customer_refer_email, only: [:show, :edit, :update, :destroy]
  before_filter :add_headers
  # GET /customer_refer_emails
  # GET /customer_refer_emails.json
  def index
    @customer_refer_emails = CustomerReferEmail.all
  end

  # GET /customer_refer_emails/1
  # GET /customer_refer_emails/1.json
  def show
  end

  # GET /customer_refer_emails/new
  def new
    @customer_refer_email = CustomerReferEmail.new
  end
  
  def refer_email_get
  end

  # GET /customer_refer_emails/1/edit
  def edit
  end
  
  def refer_email
    @customer =Customer.find_by customer_id: params[:customer_id]
    @customer_refer_email=CustomerReferEmail.where("refer_email=? and customer_id=?",params[:email],@customer.id).first
    puts @customer_refer_email
    if !@customer_refer_email.nil?
      @customer_refer_email.no_of_times_sent=@customer_refer_email.no_of_times_sent+1      
    else
      @customer_refer_email=CustomerReferEmail.new
      @customer_refer_email.refer_email=params[:email]
      @customer_refer_email.customer_id=params[:customer_id]
      @customer_refer_email.joined=false
      @customer_refer_email.no_of_times_sent=1
      
    end
    @customer.customer_refer_emails << @customer_refer_email
    puts "sending email"
    
    UserMailer.send_refer_email(@customer,@customer_refer_email).deliver_now
    render :json => {'message' => "Your friend will receive email shortly" }
  end
  
  def get_referees_by_customer
    @customer=Customer.find_by customer_id: params[:customer_id]
    @customer_refer_emails=@customer.customer_refer_emails
  end
  
  # POST /customer_refer_emails
  # POST /customer_refer_emails.json
  def create
    @customer_refer_email = CustomerReferEmail.new(customer_refer_email_params)

    respond_to do |format|
      if @customer_refer_email.save
        format.html { redirect_to @customer_refer_email, notice: 'Customer refer email was successfully created.' }
        format.json { render :show, status: :created, location: @customer_refer_email }
      else
        format.html { render :new }
        format.json { render json: @customer_refer_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_refer_emails/1
  # PATCH/PUT /customer_refer_emails/1.json
  def update
    respond_to do |format|
      if @customer_refer_email.update(customer_refer_email_params)
        format.html { redirect_to @customer_refer_email, notice: 'Customer refer email was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_refer_email }
      else
        format.html { render :edit }
        format.json { render json: @customer_refer_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_refer_emails/1
  # DELETE /customer_refer_emails/1.json
  def destroy
    @customer_refer_email.destroy
    respond_to do |format|
      format.html { redirect_to customer_refer_emails_url, notice: 'Customer refer email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_refer_email
      @customer_refer_email = CustomerReferEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_refer_email_params
      params.require(:customer_refer_email).permit(:customer_id, :refer_email, :no_of_times_sent, :joined)
    end
    
    def add_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

end
