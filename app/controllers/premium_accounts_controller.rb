class PremiumAccountsController < ApplicationController
  before_action :set_premium_account, only: [:show, :edit, :update, :destroy]

  # GET /premium_accounts
  # GET /premium_accounts.json

  def index
    @premium_accounts = PremiumAccount.all
  end

  # GET /premium_accounts/1
  # GET /premium_accounts/1.json
  def show
  end
  
  def showall
    @premium_accounts = PremiumAccount.all
    render :layout => 'custom'
  end
  # GET /premium_accounts/new
  def new
    @premium_account = PremiumAccount.new
  end

  # GET /premium_accounts/1/edit
  def edit
  end

  # POST /premium_accounts
  # POST /premium_accounts.json
  def create
    @premium_account = PremiumAccount.new(premium_account_params)

    respond_to do |format|
      if @premium_account.save
        format.html { redirect_to @premium_account, notice: 'Premium account was successfully created.' }
        format.json { render :show, status: :created, location: @premium_account }
      else
        format.html { render :new }
        format.json { render json: @premium_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premium_accounts/1
  # PATCH/PUT /premium_accounts/1.json
  def update
    respond_to do |format|
      if @premium_account.update(premium_account_params)
        format.html { redirect_to @premium_account, notice: 'Premium account was successfully updated.' }
        format.json { render :show, status: :ok, location: @premium_account }
      else
        format.html { render :edit }
        format.json { render json: @premium_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premium_accounts/1
  # DELETE /premium_accounts/1.json
  def destroy
    @premium_account.destroy
    respond_to do |format|
      format.html { redirect_to premium_accounts_url, notice: 'Premium account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium_account
      @premium_account = PremiumAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_account_params
      params.require(:premium_account).permit(:name, :amount, :validity, :description)
    end
end
