class MediaController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_medium, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /media or /media.json
  def index
    @medium = @admin.medium
  end

  # GET /media/1 or /media/1.json
  def show
    # @medium = @admin.medium.find(params[:id])
  end

  # GET /media/new
  def new
    @medium = @admin.medium || @admin.build_medium
  end

  # GET /media/1/edit
  def edit
    @medium = Medium.find(params[:id])
  end

  # POST /media or /media.json
  def create
    # @medium = Medium.new(medium_params)
    @medium = @admin.build_medium(medium_params)

    if @medium.save
      redirect_to @medium, notice: 'Media was successfully created.'
    # redirect_to company_path(@company), notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /media/1 or /media/1.json
  def update
    @medium = Medium.find(params[:id])

    # Remove selected repeaters
    if params[:medium][:repeater_images_ids_to_remove].present?
      repeater_images_ids_to_remove = params[:medium][:repeater_images_ids_to_remove].map(&:to_i)
      @medium.repeater_images.where(id: repeater_images_ids_to_remove).purge
    end

    # Remove selected banners
    if params[:medium][:banner_images_ids_to_remove].present?
      banner_images_ids_to_remove = params[:medium][:banner_images_ids_to_remove].map(&:to_i)
      @medium.banner_images.where(id: banner_images_ids_to_remove).purge
    end

    # Remove selected awards
    if params[:medium][:award_images_ids_to_remove].present?
      award_images_ids_to_remove = params[:medium][:award_images_ids_to_remove].map(&:to_i)
      @medium.award_images.where(id: award_images_ids_to_remove).purge
    end

    # Handle file attachment fields: Add new files
    @medium.repeater_images.attach(params[:medium][:repeater_images]) if params[:medium][:repeater_images].present?

    @medium.banner_images.attach(params[:medium][:banner_images]) if params[:medium][:banner_images].present?

    @medium.award_images.attach(params[:medium][:award_images]) if params[:medium][:award_images].present?

    if @medium.update(medium_params.except(:repeater_images, :banner_images, :award_images))
      redirect_to @medium, notice: 'Medium was successfully updated.'

    else
      render :edit
    end
  end

  # DELETE /media/1 or /media/1.json
  def destroy
    @medium.destroy!

    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.

  # def medium_params
  #  params.require(:medium).permit(:id, { repeater_images: [], banner_images: [], award_images: [] }, :admin_id)
  # end

  def medium_params
    params.require(:medium).permit(:id, { repeater_images_ids_to_remove: [], banner_images_ids_to_remove: [], award_images_ids_to_remove: [] }, :admin_id)
  end
end
