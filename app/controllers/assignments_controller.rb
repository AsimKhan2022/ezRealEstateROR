class AssignmentsController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_assignment, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /assignments or /assignments.json
  def index
    # @assignments = Assignment.all
    @assignments = @admin.assignments
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @assignment = @admin.assignments.find(params[:id])
  end

  # GET /assignments/new
  def new
    # @assignment = Assignment.new
    @assignment = @admin.assignments.build
    @companies = @admin.companies
    @users = @admin.users
    @properties = @admin.properties
    @sellers = @admin.sellers
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
    @companies = @admin.companies
    @users = @admin.users
    @properties = @admin.properties
    @sellers = @admin.sellers
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = @admin.assignments.build(assignment_params)

    if @assignment.save
      redirect_to @assignment, notice: 'Assignment was successfully created.'
    # redirect_to company_path(@company), notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy!

    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:admin_id, :title, :company_id, :user_id, :property_id, :seller_id)
  end
end
