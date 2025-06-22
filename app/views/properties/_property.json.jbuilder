json.extract! property, :id, :name, :address, :location, :property_type, :listing_status, :square_footage,
              :number_of_bedrooms, :number_of_bathrooms, :year_built, :admin_id, :created_at, :updated_at
json.url property_url(property, format: :json)
