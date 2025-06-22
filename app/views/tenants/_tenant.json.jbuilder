json.extract! tenant, :id, :lead_id, :admin_id, :title, :move_in_time, :move_in_date, :move_out_time, :move_out_date,
              :rent_price, :commission, :down_payment, :security_deposit, :terms, :property_condition, :utility_responsibility, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
