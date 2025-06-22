json.extract! user, :id, :name, :address, :username, :role, :mobile, :telephone, :avatar, :admin_id, :created_at,
              :updated_at
json.url user_url(user, format: :json)
