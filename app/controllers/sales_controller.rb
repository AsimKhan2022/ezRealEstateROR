class SalesController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_sale, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /sales or /sales.json
  def index
    @sales = @admin.sales
  end

  # GET /sales/1 or /sales/1.json
  def show
    @sale = @admin.sales.find(params[:id])
  end

  # GET /sales/new
  def new
    @sale = @admin.sales.build

    @witnesses = @sale.witnesses.build
    @mortgages = @sale.mortgages.build

    @leads = @admin.leads
    @buyers = @admin.buyers
    @sellers = @admin.sellers
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.includes(:witnesses, :mortgages).find(params[:id])
    @witnesses = @sale.witnesses.build if @sale.witnesses.empty?
    @mortgages = @sale.mortgages.build if @sale.mortgages.empty?

    @leads = @admin.leads
    @buyers = @admin.buyers
    @sellers = @admin.sellers
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: 'Sale was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    # Remove selected clearance certificates
    if params[:sale][:clearance_certificate_ids_to_remove].present?
      clearance_certificate_ids_to_remove = params[:sale][:clearance_certificate_ids_to_remove].map(&:to_i)
      @sale.clearance_certificate.where(id: clearance_certificate_ids_to_remove).purge
    end

    # Remove selected transfer papers
    if params[:sale][:transfer_paper_ids_to_remove].present?
      transfer_paper_ids_to_remove = params[:sale][:transfer_paper_ids_to_remove].map(&:to_i)
      @sale.transfer_paper.where(id: transfer_paper_ids_to_remove).purge
    end
    # Remove selected sales deeds
    if params[:sale][:sales_deed_ids_to_remove].present?
      sales_deed_ids_to_remove = params[:sale][:sales_deed_ids_to_remove].map(&:to_i)
      @sale.sales_deed.where(id: sales_deed_ids_to_remove).purge
    end
    # Handle file attachment fields: Add new files
    @sale.clearance_certificate.attach(params[:sale][:clearance_certificate]) if params[:sale][:clearance_certificate].present?

    @sale.transfer_paper.attach(params[:sale][:transfer_paper]) if params[:sale][:transfer_paper].present?

    @sale.sales_deed.attach(params[:sale][:sales_deed]) if params[:sale][:sales_deed].present?

    if @sale.update(sale_params.except(:clearance_certificate, :transfer_paper, :sales_deed))
      redirect_to @sale, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy!

    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:admin_id, :lead_id, :buyer_id, :seller_id, :property_verified, :mortgage_cleared, :sale_date, :sale_time,
                                 :sale_price, :commission, :agent_commission, :sales_agent_commission,
                                 clearance_certificate_ids_to_remove: [], transfer_paper_ids_to_remove: [], sales_deed_ids_to_remove: [],
                                 witnesses_attributes: %i[id cnic phone name address whatsapp email _destroy],
                                 mortgages_attributes: %i[id description outstanding_amount next_due_date paid_amount receipt interest_rate actual_cost balance _destroy])
  end
end
