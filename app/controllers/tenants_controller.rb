class TenantsController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_tenant, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /tenants or /tenants.json
  def index
    @tenants = @admin.tenants
  end

  # GET /tenants/1 or /tenants/1.json
  def show
    @tenant = @admin.tenants.find(params[:id])
  end

  # GET /tenants/new
  def new
    @tenant = @admin.tenants.build
    @conditions = @tenant.conditions.build
    @violations = @tenant.violations.build
    @leads = @admin.leads
  end

  # GET /tenants/1/edit
  def edit
    @tenant = Tenant.includes(:conditions, :violations).find(params[:id])
    @conditions = @tenant.conditions.build if @tenant.conditions.empty?
    @violations = @tenant.violations.build if @tenant.violations.empty?
    @leads = @admin.leads
  end

  # POST /tenants or /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      redirect_to @tenant, notice: 'Tenant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tenants/1 or /tenants/1.json
  def update
    @tenant = Tenant.find(params[:id])

    # Remove selected legal documents
    if params[:tenant][:legal_document_ids_to_remove].present?
      legal_document_ids_to_remove = params[:tenant][:legal_document_ids_to_remove].map(&:to_i)
      @tenant.legal_documents.where(id: legal_document_ids_to_remove).purge
    end

    # Remove selected tenant documents
    if params[:tenant][:tenant_document_ids_to_remove].present?
      tenant_document_ids_to_remove = params[:tenant][:tenant_document_ids_to_remove].map(&:to_i)
      @tenant.tenant_documents.where(id: tenant_document_ids_to_remove).purge
    end

    # Handle file attachment fields: Add new files
    @tenant.legal_documents.attach(params[:tenant][:legal_documents]) if params[:tenant][:legal_documents].present?

    @tenant.tenant_documents.attach(params[:tenant][:tenant_documents]) if params[:tenant][:tenant_documents].present?

    if @tenant.update(tenant_params.except(:legal_documents, :tenant_documents))
      redirect_to @tenant, notice: 'Tenant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tenants/1 or /tenants/1.json
  def destroy
    @tenant.destroy!

    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_tenant
  #  @tenant = Tenant.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def tenant_params
    params.require(:tenant).permit(:lead_id, :admin_id, :title, :move_in_time, :move_in_date, :move_out_time, :move_out_date, :rent_price, :commission,
                                   :down_payment, :security_deposit, :property_condition, legal_document_ids_to_remove: [],
                                                                                          tenant_document_ids_to_remove: [], terms: [], utility_responsibility: [],
                                                                                          conditions_attributes: %i[id title description validity _destroy],
                                                                                          violations_attributes: %i[id title description fine due_date paid_date _destroy])
  end
end
