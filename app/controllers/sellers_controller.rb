class SellersController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_seller, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /sellers or /sellers.json
  def index
    # @sellers = Seller.all
    @sellers = @admin.sellers
  end

  # GET /sellers/1 or /sellers/1.json
  def show
    @seller = @admin.sellers.find(params[:id])
  end

  # GET /sellers/new
  def new
    # @seller = Seller.new
    @seller = @admin.sellers.build
  end

  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
  end

  # POST /sellers or /sellers.json
  def create
    @seller = @admin.sellers.build(seller_params)

    if @seller.save
      redirect_to @seller, notice: 'Seller was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sellers/1 or /sellers/1.json
  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'Seller was successfully updated.'

    else
      render :edit
    end
  end

  # DELETE /sellers/1 or /sellers/1.json
  def destroy
    @seller.destroy!

    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_seller
  #  @seller = Seller.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def seller_params
    params.require(:seller).permit(:name, :home_address, :business_address, :email, :mobile, :telephone, :fax, :admin_id,
                                   :home_address_street_number, :business_address_street_number, :home_address_city, :business_address_city, :home_address_state, :business_address_state,
                                   :home_address_country, :business_address_country, :home_address_society, :business_address_society, :home_address_sector, :business_address_sector,
                                   :home_address_phase, :business_address_phase, :whatsapp)
  end
end
