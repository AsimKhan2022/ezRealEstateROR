class PropertiesController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /properties or /properties.json
  def index
    @properties = @admin.properties
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = @admin.properties.find(params[:id])
  end

  # GET /properties/new
  def new
    # @property = Property.new
    @property = @admin.properties.build
    @amenities = @property.amenities.build
  end

  # GET /properties/1/edit
  def edit
    # @property = Property.find(params[:id])
    @property = Property.includes(:amenities).find(params[:id])
    @amenities = @property.amenities.build if @property.amenities.empty?
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    @property = Property.find(params[:id])

    # Make sure that we only update the attachments if files are present
    @property.documents.attach(params[:property][:documents]) if params[:property][:documents].present?

    @property.main_image.attach(params[:property][:main_image]) if params[:property][:main_image].present?

    @property.images.attach(params[:property][:images]) if params[:property][:images].present?

    # Handle the removal of documents
    params[:remove_documents]&.each do |document_id|
      document = @property.documents.find(document_id)
      document.purge
    end

    # Handle the removal of images
    params[:remove_images]&.each do |image_id|
      image = @property.images.find(image_id)
      image.purge
    end

    # Handle the removal of main image
    @property.main_image.purge if params[:remove_main_image] == 'true'

    # Now check if the main image is missing after any removal
    if @property.main_image.nil? || params[:remove_main_image] == 'true'
      @property.errors.add(:main_image, "can't be blank") # Add validation error if no main image selected
      render :edit and return
    end

    # Handle image removals for amenities
    params[:property][:amenities_attributes].each do |key, amenity_params|
      if amenity_params[:_destroy] == '1'
        amenity = @property.amenities.find(key)
        amenity.image_logo.purge if amenity.image_logo.attached?
      end
    end

    if @property.update(property_params.except(:documents, :main_image, :images))
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy!

    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:name, :address, :property_type, :listing_status, :square_footage, :number_of_bedrooms, :is_verified, :investigator_id,
                                     :number_of_bathrooms, :year_built, :admin_id, :latitude, :longitude, :asking_price,
                                     :city, :state, :country, :society, :sector, :phase, :street_number, :footage_unit, :currency,
                                     documents: [], main_image: [], images: [],
                                     amenities_attributes: %i[id amenity_type name image_logo capacity _destroy]) # .merge(admin_id: @admin.id)
  end
end
