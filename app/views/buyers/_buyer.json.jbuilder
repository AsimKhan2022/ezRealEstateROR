json.extract! buyer, :id, :name, :home_address, :business_address, :email, :mobile, :telephone, :fax, :admin_id,
              :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
