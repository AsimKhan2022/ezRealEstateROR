class BuyersController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_buyer, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /buyers or /buyers.json
  def index
    # @buyers = Buyer.all
    @buyers = @admin.buyers
  end

  # GET /buyers/1 or /buyers/1.json
  def show
    @buyer = @admin.buyers.find(params[:id])
  end

  # GET /buyers/new
  def new
    # @buyer = Buyer.new
    @buyer = @admin.buyers.build
  end

  # GET /buyers/1/edit
  def edit
    @buyer = Buyer.find(params[:id])
  end

  # POST /buyers or /buyers.json
  def create
    @buyer = @admin.buyers.build(buyer_params)

    if @buyer.save
      redirect_to @buyer, notice: 'Buyer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /buyers/1 or /buyers/1.json
  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: 'Buyer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /buyers/1 or /buyers/1.json
  def destroy
    @buyer.destroy!

    respond_to do |format|
      format.html { redirect_to buyers_url, notice: 'Buyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_buyer
  #  @buyer = Buyer.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def buyer_params
    params.require(:buyer).permit(:name, :home_address, :business_address, :email, :mobile, :telephone, :fax, :admin_id,
                                  :home_address_street_number, :business_address_street_number,
                                  :home_address_city, :business_address_city,
                                  :home_address_state, :business_address_state,
                                  :home_address_country, :business_address_country,
                                  :home_address_society, :business_address_society,
                                  :home_address_sector, :business_address_sector,
                                  :home_address_phase, :business_address_phase,
                                  :whatsapp)
  end
end
