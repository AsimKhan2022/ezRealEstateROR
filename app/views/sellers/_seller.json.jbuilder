json.extract! seller, :id, :name, :home_address, :business_address, :email, :mobile, :telephone, :fax, :admin_id,
              :created_at, :updated_at
json.url seller_url(seller, format: :json)
