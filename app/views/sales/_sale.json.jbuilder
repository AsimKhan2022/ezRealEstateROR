json.extract! sale, :id, :admin_id, :lead_id, :buyer_id, :seller_id, :property_verified, :mortgage_cleared, :sale_date,
              :sale_time, :created_at, :updated_at
json.url sale_url(sale, format: :json)
