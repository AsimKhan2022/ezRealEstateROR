json.extract! company, :id, :name, :owner, :address, :email, :avatar, :documents, :admin_id, :created_at, :updated_at
json.url company_url(company, format: :json)
