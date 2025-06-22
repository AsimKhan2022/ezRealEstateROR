# module Admin
class CompaniesController < ApplicationController
  include AuthorizedController
  include Rails.application.routes.url_helpers
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /companies or /companies.json
  def index
    # @companies = Company.all
    @companies = @admin.companies
  end

  # GET /companies/1 or /companies/1.json
  def show
    @company = @admin.companies.find(params[:id])
  end

  # GET /companies/new
  def new
    # @company = Company.new
    @company = @admin.companies.build
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies or /companies.json
  def create
    @company = @admin.companies.build(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    # redirect_to company_path(@company), notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    @company = Company.find(params[:id])

    # Remove selected documents
    if params[:company][:document_ids_to_remove].present?
      document_ids_to_remove = params[:company][:document_ids_to_remove].map(&:to_i)
      @company.documents.where(id: document_ids_to_remove).purge
    end

    # Remove selected license certificates
    if params[:company][:license_certificate_ids_to_remove].present?
      license_certificate_ids_to_remove = params[:company][:license_certificate_ids_to_remove].map(&:to_i)
      @company.license_certificates.where(id: license_certificate_ids_to_remove).purge
    end

    # Remove selected tax certificates
    if params[:company][:tax_certificate_ids_to_remove].present?
      tax_certificate_ids_to_remove = params[:company][:tax_certificate_ids_to_remove].map(&:to_i)
      @company.tax_certificates.where(id: tax_certificate_ids_to_remove).purge
    end

    # Handle file attachment fields: Add new files
    @company.documents.attach(params[:company][:documents]) if params[:company][:documents].present?

    @company.license_certificates.attach(params[:company][:license_certificates]) if params[:company][:license_certificates].present?

    @company.tax_certificates.attach(params[:company][:tax_certificates]) if params[:company][:tax_certificates].present?

    # Now update the company with other fields (excluding attachments)
    if @company.update_without_email_validation(company_params.except(:documents, :license_certificates, :tax_certificates))
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(
      :id, :name, :owner, :address, :email, :avatar, :secondary_email, :mobile, :fax, :whatsapp,
      :state, :city, :country, :street_number, :society, :sector, :phase, :admin_id,
      document_ids_to_remove: [], license_certificate_ids_to_remove: [], tax_certificate_ids_to_remove: []
    )
  end
end
# end
