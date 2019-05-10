# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_10_180538) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "patio"
    t.string "number"
    t.string "zip"
    t.bigint "district_id"
    t.string "complement"
    t.string "reference"
    t.bigint "registry_id"
    t.string "longitude"
    t.string "latitude"
    t.text "geo_json"
    t.boolean "sus_system"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["registry_id"], name: "index_addresses_on_registry_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "code"
    t.bigint "state_id"
    t.string "reference"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.bigint "registry_id"
    t.bigint "gender_id"
    t.bigint "race_id"
    t.date "birth_date"
    t.bigint "birth_state_id"
    t.bigint "birth_country_id"
    t.bigint "nationality_id"
    t.string "sus_card_number"
    t.string "pis_pasep_number"
    t.boolean "unknown_mother_name"
    t.bigint "responsible_person_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_country_id"], name: "index_citizens_on_birth_country_id"
    t.index ["birth_state_id"], name: "index_citizens_on_birth_state_id"
    t.index ["company_id"], name: "index_citizens_on_company_id"
    t.index ["gender_id"], name: "index_citizens_on_gender_id"
    t.index ["nationality_id"], name: "index_citizens_on_nationality_id"
    t.index ["race_id"], name: "index_citizens_on_race_id"
    t.index ["registry_id"], name: "index_citizens_on_registry_id"
    t.index ["responsible_person_id"], name: "index_citizens_on_responsible_person_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "registry_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registry_id"], name: "index_companies_on_registry_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "contact_type_id"
    t.string "contact"
    t.string "observation"
    t.bigint "registry_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id"
    t.index ["registry_id"], name: "index_contacts_on_registry_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "zone_id"
    t.bigint "city_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
    t.index ["zone_id"], name: "index_districts_on_zone_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "generic_models", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "reference"
    t.string "generic_field"
    t.string "generic_class"
    t.bigint "generic_model_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["generic_model_id"], name: "index_generic_models_on_generic_model_id"
  end

  create_table "health_conditions", force: :cascade do |t|
    t.text "hospitalization_cause"
    t.string "maternity_reference"
    t.bigint "weight_situation_id"
    t.boolean "alcohol_dependent"
    t.boolean "other_drugs_dependent"
    t.boolean "smoker"
    t.boolean "pregnant"
    t.boolean "bedridden"
    t.boolean "domiciled"
    t.boolean "diabetic"
    t.boolean "leprosy"
    t.boolean "tuberculosis"
    t.boolean "avc_stroke"
    t.boolean "had_heart_attack"
    t.boolean "had_heart_disease"
    t.boolean "recently_hospitalized"
    t.text "recently_hospitalized_cause"
    t.boolean "mental_issue"
    t.boolean "integrative_practices"
    t.boolean "medicinal_plants"
    t.text "medicinal_plants_used"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_conditions_on_company_id"
    t.index ["weight_situation_id"], name: "index_health_conditions_on_weight_situation_id"
  end

  create_table "health_establishments", force: :cascade do |t|
    t.string "cnes_code"
    t.string "unit_code"
    t.bigint "registry_id"
    t.date "registry_at"
    t.bigint "manager_id"
    t.bigint "unit_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_establishments_on_company_id"
    t.index ["manager_id"], name: "index_health_establishments_on_manager_id"
    t.index ["registry_id"], name: "index_health_establishments_on_registry_id"
    t.index ["unit_type_id"], name: "index_health_establishments_on_unit_type_id"
  end

  create_table "health_professionals", force: :cascade do |t|
    t.string "cns_code"
    t.string "cbo_code"
    t.bigint "registry_id"
    t.bigint "health_establishment_id"
    t.bigint "professional_team_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_professionals_on_company_id"
    t.index ["health_establishment_id"], name: "index_health_professionals_on_health_establishment_id"
    t.index ["professional_team_id"], name: "index_health_professionals_on_professional_team_id"
    t.index ["registry_id"], name: "index_health_professionals_on_registry_id"
  end

  create_table "individual_registrations", force: :cascade do |t|
    t.bigint "citizen_id"
    t.bigint "health_condition_id"
    t.bigint "street_situation_id"
    t.bigint "sociodemographic_info_id"
    t.boolean "refuse_registration"
    t.boolean "form_updated"
    t.bigint "tb_cds_origin_id"
    t.string "uuid"
    t.string "uuid_form_origin"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["citizen_id"], name: "index_individual_registrations_on_citizen_id"
    t.index ["company_id"], name: "index_individual_registrations_on_company_id"
    t.index ["health_condition_id"], name: "index_individual_registrations_on_health_condition_id"
    t.index ["sociodemographic_info_id"], name: "index_individual_registrations_on_sociodemographic_info_id"
    t.index ["street_situation_id"], name: "index_individual_registrations_on_street_situation_id"
    t.index ["tb_cds_origin_id"], name: "index_individual_registrations_on_tb_cds_origin_id"
  end

  create_table "other_health_conditions", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "health_condition_type_id"
    t.text "description"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_other_health_conditions_on_company_id"
    t.index ["health_condition_id"], name: "index_other_health_conditions_on_health_condition_id"
    t.index ["health_condition_type_id"], name: "index_other_health_conditions_on_health_condition_type_id"
  end

  create_table "professional_teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_professional_teams_on_company_id"
  end

  create_table "registries", force: :cascade do |t|
    t.bigint "person_type_id"
    t.string "legal_full_name"
    t.string "fancy_name"
    t.string "social_name"
    t.string "federal_registry"
    t.string "state_registry"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_type_id"], name: "index_registries_on_person_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "icon"
    t.string "reference"
    t.bigint "role_id"
    t.bigint "app_module_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_module_id"], name: "index_roles_on_app_module_id"
    t.index ["role_id"], name: "index_roles_on_role_id"
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sociodemographic_infos", force: :cascade do |t|
    t.boolean "has_disabilities"
    t.text "citizen_disabilities"
    t.bigint "education_level_id"
    t.bigint "exit_reason_id"
    t.bigint "sexual_orientation_id"
    t.string "traditional_community"
    t.bigint "parent_relation_id"
    t.integer "child_responsible"
    t.bigint "job_market_situation_id"
    t.boolean "desire_sexual_orientation"
    t.boolean "attend_folk_healer"
    t.boolean "has_traditional_community"
    t.boolean "community_group"
    t.boolean "has_health_plan"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_sociodemographic_infos_on_company_id"
    t.index ["education_level_id"], name: "index_sociodemographic_infos_on_education_level_id"
    t.index ["exit_reason_id"], name: "index_sociodemographic_infos_on_exit_reason_id"
    t.index ["job_market_situation_id"], name: "index_sociodemographic_infos_on_job_market_situation_id"
    t.index ["parent_relation_id"], name: "index_sociodemographic_infos_on_parent_relation_id"
    t.index ["sexual_orientation_id"], name: "index_sociodemographic_infos_on_sexual_orientation_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "code"
    t.string "reference"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "street_situations", force: :cascade do |t|
    t.string "kinship_degree"
    t.string "other_accompanied"
    t.integer "meals_per_day"
    t.text "meals_origin"
    t.boolean "accompanied"
    t.boolean "familiar_reference"
    t.boolean "receive_benefits"
    t.boolean "street_situation"
    t.boolean "has_personal_hygiene"
    t.text "personal_hygiene"
    t.boolean "family_visit"
    t.integer "street_situation_time"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_street_situations_on_company_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.boolean "current"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_company_id"
    t.bigint "role_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_company_id"], name: "index_user_roles_on_user_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.bigint "health_professional_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.json "tokens"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["health_professional_id"], name: "index_users_on_health_professional_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "registries"
  add_foreign_key "cities", "states"
  add_foreign_key "citizens", "citizens", column: "responsible_person_id"
  add_foreign_key "citizens", "companies"
  add_foreign_key "citizens", "generic_models", column: "birth_country_id"
  add_foreign_key "citizens", "generic_models", column: "gender_id"
  add_foreign_key "citizens", "generic_models", column: "nationality_id"
  add_foreign_key "citizens", "generic_models", column: "race_id"
  add_foreign_key "citizens", "registries"
  add_foreign_key "citizens", "states", column: "birth_state_id"
  add_foreign_key "companies", "registries"
  add_foreign_key "contacts", "generic_models", column: "contact_type_id"
  add_foreign_key "contacts", "registries"
  add_foreign_key "districts", "cities"
  add_foreign_key "districts", "generic_models", column: "zone_id"
  add_foreign_key "generic_models", "generic_models"
  add_foreign_key "health_conditions", "companies"
  add_foreign_key "health_conditions", "generic_models", column: "weight_situation_id"
  add_foreign_key "health_establishments", "companies"
  add_foreign_key "health_establishments", "generic_models", column: "unit_type_id"
  add_foreign_key "health_establishments", "registries"
  add_foreign_key "health_establishments", "registries", column: "manager_id"
  add_foreign_key "health_professionals", "companies"
  add_foreign_key "health_professionals", "health_establishments"
  add_foreign_key "health_professionals", "professional_teams"
  add_foreign_key "health_professionals", "registries"
  add_foreign_key "individual_registrations", "citizens"
  add_foreign_key "individual_registrations", "companies"
  add_foreign_key "individual_registrations", "generic_models", column: "tb_cds_origin_id"
  add_foreign_key "individual_registrations", "health_conditions"
  add_foreign_key "individual_registrations", "sociodemographic_infos"
  add_foreign_key "individual_registrations", "street_situations"
  add_foreign_key "other_health_conditions", "companies"
  add_foreign_key "other_health_conditions", "generic_models", column: "health_condition_type_id"
  add_foreign_key "other_health_conditions", "health_conditions"
  add_foreign_key "professional_teams", "companies"
  add_foreign_key "registries", "generic_models", column: "person_type_id"
  add_foreign_key "roles", "generic_models", column: "app_module_id"
  add_foreign_key "roles", "roles"
  add_foreign_key "sociodemographic_infos", "companies"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "education_level_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "exit_reason_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "job_market_situation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "parent_relation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "sexual_orientation_id"
  add_foreign_key "street_situations", "companies"
  add_foreign_key "user_companies", "companies"
  add_foreign_key "user_companies", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "user_companies"
  add_foreign_key "users", "health_professionals"
end
