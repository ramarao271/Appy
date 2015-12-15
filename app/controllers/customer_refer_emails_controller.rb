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
    emails=params[:email].split(',')
    remail=params[:remail]
    emails.each { |email|
    if !email.empty?
      @customer_refer_email=CustomerReferEmail.where("refer_email=? and customer_id=?",email,@customer.id.to_s).first
      if !@customer_refer_email.nil?
        @customer_refer_email.no_of_times_sent=@customer_refer_email.no_of_times_sent+1      
      else
        @customer_refer_email=CustomerReferEmail.new
        @customer_refer_email.refer_email=email
        @customer_refer_email.customer_id=params[:customer_id]
        @customer_refer_email.status="REFERRED"
        @customer_refer_email.no_of_times_sent=1
        @customer_refer_email.medium="Gmail"
        @customer.customer_refer_emails << @customer_refer_email
      end
      #UserMailer.send_refer_email(@customer,@customer_refer_email).deliver_now
      require 'gmail_xoauth'
        gmail1 = Gmail.connect(:xoauth, remail, 
            :token           => params[:access_token],
            :secret          => 'anonymous',
            :consumer_key    => '841347901060-t2jv52dot6698vbrndovj7mbiehau1kf.apps.googleusercontent.com',
            :consumer_secret => 'U7jr5w8Vgd66rfbntakmzOx3'
        )
        email_content="Hey,<br/>Didn't want to leave you behind. <br/>Love to buy quality ethnic fashion at fair prices.<br/>Checkout great Sarees & Salwar Suits collection and receive exclusive \"Club Silk\" membership (worth Rs. 2500) for Free by registering with this link.#{params[:link]}"
        if !email.empty?
          gmail1.deliver do
            to email
            subject "Checkout VaVarna you will like it"
            text_part do
              body "Text of plaintext message."
            end
            html_part do
              content_type 'text/html; charset=UTF-8'
              body email_content 
            end
          end
        end
    end  
    }

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
