class LeadsController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_lead, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /leads or /leads.json
  def index
    @leads = @admin.leads
  end

  # GET /leads/1 or /leads/1.json
  def show
    @lead = @admin.leads.find(params[:id])
  end

  # GET /leads/new
  def new
    @lead = @admin.leads.build
    @tracks = @lead.tracks.build
    @assignments = @admin.assignments
    @buyers = @admin.buyers
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.includes(:tracks).find(params[:id])
    @tracks = @lead.tracks.build if @lead.tracks.empty?
    @assignments = @admin.assignments
    @buyers = @admin.buyers
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to @lead, notice: 'Lead was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    @lead = Lead.find(params[:id])
    if @lead.update(lead_params)
      redirect_to @lead, notice: 'Lead was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy!

    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_lead
  #  @lead = Lead.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def lead_params
    params.require(:lead).permit(:assignment_id, :title, :admin_id,
                                 tracks_attributes: %i[id buyer_id status description visit_date visit_time _destroy])
  end
end
