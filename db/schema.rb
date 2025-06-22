# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_01_024152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.string "telephone"
    t.string "mobile_phone"
    t.string "subscription_type"
    t.date "subscription_start_date"
    t.date "subscription_end_date"
    t.date "trial_start_date"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.string "amenity_type"
    t.string "name"
    t.string "capacity"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_amenities_on_property_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "story"
    t.json "images"
    t.text "headlines"
    t.string "sub_title"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_articles_on_admin_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_id"
    t.string "title"
    t.index ["admin_id"], name: "index_assignments_on_admin_id"
    t.index ["company_id"], name: "index_assignments_on_company_id"
    t.index ["property_id"], name: "index_assignments_on_property_id"
    t.index ["seller_id"], name: "index_assignments_on_seller_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "home_address"
    t.string "business_address"
    t.string "email"
    t.string "mobile"
    t.string "telephone"
    t.string "fax"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "home_address_street_number"
    t.integer "business_address_street_number"
    t.string "home_address_city"
    t.string "business_address_city"
    t.string "home_address_state"
    t.string "business_address_state"
    t.string "home_address_country"
    t.string "business_address_country"
    t.string "home_address_society"
    t.string "business_address_society"
    t.string "home_address_sector"
    t.string "business_address_sector"
    t.string "home_address_phase"
    t.string "business_address_phase"
    t.string "whatsapp"
    t.index ["admin_id"], name: "index_buyers_on_admin_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "address"
    t.string "email"
    t.string "avatar"
    t.json "documents"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "secondary_email"
    t.string "mobile"
    t.string "fax"
    t.string "whatsapp"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "street_number"
    t.string "society"
    t.string "sector"
    t.string "phase"
    t.json "license_certificates"
    t.json "tax_certificates"
    t.index ["admin_id"], name: "index_companies_on_admin_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.date "validity"
    t.index ["tenant_id"], name: "index_conditions_on_tenant_id"
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.string "title"
    t.index ["admin_id"], name: "index_leads_on_admin_id"
    t.index ["assignment_id"], name: "index_leads_on_assignment_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_media_on_admin_id"
  end

  create_table "mortgages", force: :cascade do |t|
    t.text "description"
    t.decimal "outstanding_amount"
    t.date "next_due_date"
    t.decimal "paid_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id", null: false
    t.decimal "interest_rate"
    t.decimal "actual_cost"
    t.decimal "balance"
    t.index ["sale_id"], name: "index_mortgages_on_sale_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "property_type"
    t.string "listing_status"
    t.integer "square_footage"
    t.integer "number_of_bedrooms"
    t.integer "number_of_bathrooms"
    t.integer "year_built"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_verified"
    t.float "latitude"
    t.float "longitude"
    t.decimal "asking_price"
    t.integer "street_number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "society"
    t.string "sector"
    t.string "phase"
    t.integer "investigator_id"
    t.string "footage_unit"
    t.string "currency"
    t.index ["admin_id"], name: "index_properties_on_admin_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "lead_id", null: false
    t.bigint "buyer_id", null: false
    t.bigint "seller_id", null: false
    t.boolean "property_verified"
    t.boolean "mortgage_cleared"
    t.date "sale_date"
    t.time "sale_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "sale_price"
    t.decimal "commission"
    t.decimal "agent_commission"
    t.decimal "sales_agent_commission"
    t.index ["admin_id"], name: "index_sales_on_admin_id"
    t.index ["buyer_id"], name: "index_sales_on_buyer_id"
    t.index ["lead_id"], name: "index_sales_on_lead_id"
    t.index ["seller_id"], name: "index_sales_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "home_address"
    t.string "business_address"
    t.string "email"
    t.string "mobile"
    t.string "telephone"
    t.string "fax"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "home_address_street_number"
    t.integer "business_address_street_number"
    t.string "home_address_city"
    t.string "business_address_city"
    t.string "home_address_state"
    t.string "business_address_state"
    t.string "home_address_country"
    t.string "business_address_country"
    t.string "home_address_society"
    t.string "business_address_society"
    t.integer "home_address_sector"
    t.integer "business_address_sector"
    t.string "home_address_phase"
    t.string "business_address_phase"
    t.string "whatsapp"
    t.index ["admin_id"], name: "index_sellers_on_admin_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "admin_id", null: false
    t.string "title"
    t.time "move_in_time"
    t.date "move_in_date"
    t.time "move_out_time"
    t.date "move_out_date"
    t.decimal "rent_price"
    t.decimal "commission"
    t.decimal "down_payment"
    t.decimal "security_deposit"
    t.text "property_condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "terms", default: [], array: true
    t.string "utility_responsibility", default: [], array: true
    t.index ["admin_id"], name: "index_tenants_on_admin_id"
    t.index ["lead_id"], name: "index_tenants_on_lead_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "buyer_id", null: false
    t.integer "status"
    t.text "description"
    t.date "visit_date"
    t.time "visit_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_tracks_on_buyer_id"
    t.index ["lead_id"], name: "index_tracks_on_lead_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "username"
    t.string "avatar"
    t.string "mobile"
    t.string "telephone"
    t.string "address"
    t.integer "role"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "whatsapp"
    t.string "secondary_email"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "phase"
    t.string "sector"
    t.integer "street_number"
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "violations", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.decimal "fine"
    t.date "due_date"
    t.date "paid_date"
    t.index ["tenant_id"], name: "index_violations_on_tenant_id"
  end

  create_table "witnesses", force: :cascade do |t|
    t.string "cnic"
    t.string "phone"
    t.string "name"
    t.bigint "sale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "whatsapp"
    t.string "email"
    t.index ["sale_id"], name: "index_witnesses_on_sale_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "amenities", "properties"
  add_foreign_key "articles", "admins"
  add_foreign_key "assignments", "admins"
  add_foreign_key "assignments", "companies"
  add_foreign_key "assignments", "properties"
  add_foreign_key "assignments", "sellers"
  add_foreign_key "assignments", "users"
  add_foreign_key "buyers", "admins"
  add_foreign_key "companies", "admins"
  add_foreign_key "conditions", "tenants"
  add_foreign_key "leads", "admins"
  add_foreign_key "leads", "assignments"
  add_foreign_key "media", "admins"
  add_foreign_key "mortgages", "sales"
  add_foreign_key "properties", "admins"
  add_foreign_key "sales", "admins"
  add_foreign_key "sales", "buyers"
  add_foreign_key "sales", "leads"
  add_foreign_key "sales", "sellers"
  add_foreign_key "sellers", "admins"
  add_foreign_key "tenants", "admins"
  add_foreign_key "tenants", "leads"
  add_foreign_key "tracks", "buyers"
  add_foreign_key "tracks", "leads"
  add_foreign_key "violations", "tenants"
  add_foreign_key "witnesses", "sales"
end
