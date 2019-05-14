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

ActiveRecord::Schema.define(version: 2019_05_14_180036) do

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
    t.bigint "address_type_id"
    t.string "patio"
    t.string "number"
    t.string "zip"
    t.string "complement"
    t.string "district"
    t.bigint "city_id"
    t.string "referential_phone"
    t.string "home_phone"
    t.string "reference"
    t.boolean "out_area"
    t.string "micro_area"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["company_id"], name: "index_addresses_on_company_id"
  end

  create_table "cancel_registrations", force: :cascade do |t|
    t.bigint "left_reason_id"
    t.date "decease_date"
    t.date "decease_number"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_cancel_registrations_on_company_id"
    t.index ["left_reason_id"], name: "index_cancel_registrations_on_left_reason_id"
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

  create_table "companies", force: :cascade do |t|
    t.bigint "registry_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registry_id"], name: "index_companies_on_registry_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "home_registration_id"
    t.date "responsible_birth_date"
    t.string "responsible_cns_number"
    t.integer "family_members"
    t.string "handbook_number"
    t.integer "family_income_cents"
    t.date "reside_since"
    t.boolean "moving"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_families_on_company_id"
    t.index ["home_registration_id"], name: "index_families_on_home_registration_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "social_name"
    t.bigint "city_id"
    t.date "birth_date"
    t.boolean "unknown_mother"
    t.string "email"
    t.bigint "nationality_id"
    t.string "full_name"
    t.string "cns_number"
    t.string "cns_responsible"
    t.string "phone"
    t.string "pis_pasep_number"
    t.bigint "birth_country_id"
    t.bigint "race_id"
    t.bigint "gender_id"
    t.boolean "responsible"
    t.bigint "ethnicity_id"
    t.boolean "unknown_father"
    t.string "father_name"
    t.date "naturalized_at"
    t.string "naturalize_decree"
    t.date "brazil_entry_date"
    t.string "micro_area"
    t.boolean "out_area"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_country_id"], name: "index_family_members_on_birth_country_id"
    t.index ["city_id"], name: "index_family_members_on_city_id"
    t.index ["company_id"], name: "index_family_members_on_company_id"
    t.index ["ethnicity_id"], name: "index_family_members_on_ethnicity_id"
    t.index ["gender_id"], name: "index_family_members_on_gender_id"
    t.index ["nationality_id"], name: "index_family_members_on_nationality_id"
    t.index ["race_id"], name: "index_family_members_on_race_id"
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

  create_table "health_condition_diseases", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "disease_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_condition_diseases_on_company_id"
    t.index ["disease_type_id"], name: "index_health_condition_diseases_on_disease_type_id"
    t.index ["health_condition_id"], name: "index_health_condition_diseases_on_health_condition_id"
  end

  create_table "health_condition_others", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.text "description"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_condition_others_on_company_id"
    t.index ["health_condition_id"], name: "index_health_condition_others_on_health_condition_id"
  end

  create_table "health_conditions", force: :cascade do |t|
    t.text "hospitalization_cause"
    t.text "other_condition_one"
    t.text "other_condition_two"
    t.text "other_condition_three"
    t.text "medicinal_plants_used"
    t.string "maternity_reference"
    t.bigint "weight_situation_id"
    t.boolean "alcohol_dependent"
    t.boolean "other_drugs_dependent"
    t.boolean "smoker"
    t.boolean "pregnant"
    t.boolean "bedridden"
    t.boolean "domiciled"
    t.boolean "diabetic"
    t.boolean "respiratory"
    t.boolean "hypertension"
    t.boolean "cancer"
    t.boolean "kidneys"
    t.boolean "leprosy"
    t.boolean "tuberculosis"
    t.boolean "avc_stroke"
    t.boolean "had_heart_attack"
    t.boolean "had_heart_disease"
    t.boolean "recently_hospitalized"
    t.boolean "mental_issue"
    t.boolean "integrative_practices"
    t.boolean "medicinal_plants"
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

  create_table "home_registration_pets", force: :cascade do |t|
    t.bigint "home_registration_id"
    t.bigint "pet_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_home_registration_pets_on_company_id"
    t.index ["home_registration_id"], name: "index_home_registration_pets_on_home_registration_id"
    t.index ["pet_type_id"], name: "index_home_registration_pets_on_pet_type_id"
  end

  create_table "home_registrations", force: :cascade do |t|
    t.bigint "health_professional_id"
    t.bigint "living_condition_id"
    t.bigint "address_id"
    t.boolean "registry_updated"
    t.integer "pet_quantity"
    t.boolean "refuse_registration"
    t.integer "tp_cds_origin"
    t.string "uuid"
    t.string "uuid_origin"
    t.bigint "home_type_id"
    t.bigint "permanence_institution_id"
    t.boolean "finished"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_home_registrations_on_address_id"
    t.index ["company_id"], name: "index_home_registrations_on_company_id"
    t.index ["health_professional_id"], name: "index_home_registrations_on_health_professional_id"
    t.index ["home_type_id"], name: "index_home_registrations_on_home_type_id"
    t.index ["living_condition_id"], name: "index_home_registrations_on_living_condition_id"
    t.index ["permanence_institution_id"], name: "index_home_registrations_on_permanence_institution_id"
  end

  create_table "in_street_situations", force: :cascade do |t|
    t.string "kinship_degree"
    t.string "other_accompanied"
    t.bigint "meals_per_day_id"
    t.boolean "has_other_accompanied"
    t.boolean "familiar_reference"
    t.boolean "receive_benefits"
    t.boolean "in_street_situation"
    t.boolean "has_personal_hygiene"
    t.boolean "family_visit"
    t.bigint "street_situation_time_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_in_street_situations_on_company_id"
    t.index ["meals_per_day_id"], name: "index_in_street_situations_on_meals_per_day_id"
    t.index ["street_situation_time_id"], name: "index_in_street_situations_on_street_situation_time_id"
  end

  create_table "individual_registrations", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "in_street_situation_id"
    t.bigint "family_member_id"
    t.bigint "sociodemographic_info_id"
    t.bigint "cancel_registration_id"
    t.boolean "refuse_registration"
    t.boolean "form_updated"
    t.string "uuid"
    t.string "uuid_form_origin"
    t.string "uuid_citizen"
    t.integer "tp_cds_origin"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cancel_registration_id"], name: "index_individual_registrations_on_cancel_registration_id"
    t.index ["company_id"], name: "index_individual_registrations_on_company_id"
    t.index ["family_member_id"], name: "index_individual_registrations_on_family_member_id"
    t.index ["health_condition_id"], name: "index_individual_registrations_on_health_condition_id"
    t.index ["in_street_situation_id"], name: "index_individual_registrations_on_in_street_situation_id"
    t.index ["sociodemographic_info_id"], name: "index_individual_registrations_on_sociodemographic_info_id"
  end

  create_table "living_conditions", force: :cascade do |t|
    t.bigint "water_supply_id"
    t.bigint "rural_production_area_id"
    t.bigint "garbage_disposal_id"
    t.bigint "bathroom_drainage_id"
    t.bigint "home_location_id"
    t.bigint "home_wall_material_id"
    t.integer "rooms"
    t.integer "residents"
    t.bigint "home_situation_id"
    t.boolean "electric_power"
    t.bigint "home_access_id"
    t.bigint "home_type_id"
    t.bigint "water_treatment_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bathroom_drainage_id"], name: "index_living_conditions_on_bathroom_drainage_id"
    t.index ["company_id"], name: "index_living_conditions_on_company_id"
    t.index ["garbage_disposal_id"], name: "index_living_conditions_on_garbage_disposal_id"
    t.index ["home_access_id"], name: "index_living_conditions_on_home_access_id"
    t.index ["home_location_id"], name: "index_living_conditions_on_home_location_id"
    t.index ["home_situation_id"], name: "index_living_conditions_on_home_situation_id"
    t.index ["home_type_id"], name: "index_living_conditions_on_home_type_id"
    t.index ["home_wall_material_id"], name: "index_living_conditions_on_home_wall_material_id"
    t.index ["rural_production_area_id"], name: "index_living_conditions_on_rural_production_area_id"
    t.index ["water_supply_id"], name: "index_living_conditions_on_water_supply_id"
    t.index ["water_treatment_id"], name: "index_living_conditions_on_water_treatment_id"
  end

  create_table "permanence_institutions", force: :cascade do |t|
    t.string "name"
    t.boolean "other_linked_professionals"
    t.string "responsible_name"
    t.string "responsible_cns"
    t.string "institutional_role"
    t.string "responsible_phone"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_permanence_institutions_on_company_id"
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
    t.bigint "education_level_id"
    t.bigint "occupation_id"
    t.bigint "sexual_orientation_id"
    t.string "traditional_community_name"
    t.bigint "parent_relation_id"
    t.bigint "job_market_situation_id"
    t.boolean "desire_orientation"
    t.boolean "attend_folk_healer"
    t.boolean "traditional_community"
    t.boolean "attend_school"
    t.boolean "community_group"
    t.boolean "health_plan"
    t.boolean "desire_gender"
    t.bigint "gender_identity_id"
    t.bigint "child_responsible_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_responsible_id"], name: "index_sociodemographic_infos_on_child_responsible_id"
    t.index ["company_id"], name: "index_sociodemographic_infos_on_company_id"
    t.index ["education_level_id"], name: "index_sociodemographic_infos_on_education_level_id"
    t.index ["gender_identity_id"], name: "index_sociodemographic_infos_on_gender_identity_id"
    t.index ["job_market_situation_id"], name: "index_sociodemographic_infos_on_job_market_situation_id"
    t.index ["occupation_id"], name: "index_sociodemographic_infos_on_occupation_id"
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
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "generic_models", column: "address_type_id"
  add_foreign_key "cancel_registrations", "companies"
  add_foreign_key "cancel_registrations", "generic_models", column: "left_reason_id"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "registries"
  add_foreign_key "families", "companies"
  add_foreign_key "families", "home_registrations"
  add_foreign_key "family_members", "cities"
  add_foreign_key "family_members", "companies"
  add_foreign_key "family_members", "generic_models", column: "birth_country_id"
  add_foreign_key "family_members", "generic_models", column: "ethnicity_id"
  add_foreign_key "family_members", "generic_models", column: "gender_id"
  add_foreign_key "family_members", "generic_models", column: "nationality_id"
  add_foreign_key "family_members", "generic_models", column: "race_id"
  add_foreign_key "generic_models", "generic_models"
  add_foreign_key "health_condition_diseases", "companies"
  add_foreign_key "health_condition_diseases", "generic_models", column: "disease_type_id"
  add_foreign_key "health_condition_diseases", "health_conditions"
  add_foreign_key "health_condition_others", "companies"
  add_foreign_key "health_condition_others", "health_conditions"
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
  add_foreign_key "home_registration_pets", "companies"
  add_foreign_key "home_registration_pets", "generic_models", column: "pet_type_id"
  add_foreign_key "home_registration_pets", "home_registrations"
  add_foreign_key "home_registrations", "addresses"
  add_foreign_key "home_registrations", "companies"
  add_foreign_key "home_registrations", "generic_models", column: "home_type_id"
  add_foreign_key "home_registrations", "health_professionals"
  add_foreign_key "home_registrations", "living_conditions"
  add_foreign_key "home_registrations", "permanence_institutions"
  add_foreign_key "in_street_situations", "companies"
  add_foreign_key "in_street_situations", "generic_models", column: "meals_per_day_id"
  add_foreign_key "in_street_situations", "generic_models", column: "street_situation_time_id"
  add_foreign_key "individual_registrations", "cancel_registrations"
  add_foreign_key "individual_registrations", "companies"
  add_foreign_key "individual_registrations", "family_members"
  add_foreign_key "individual_registrations", "health_conditions"
  add_foreign_key "individual_registrations", "in_street_situations"
  add_foreign_key "individual_registrations", "sociodemographic_infos"
  add_foreign_key "living_conditions", "companies"
  add_foreign_key "living_conditions", "generic_models", column: "bathroom_drainage_id"
  add_foreign_key "living_conditions", "generic_models", column: "garbage_disposal_id"
  add_foreign_key "living_conditions", "generic_models", column: "home_access_id"
  add_foreign_key "living_conditions", "generic_models", column: "home_location_id"
  add_foreign_key "living_conditions", "generic_models", column: "home_situation_id"
  add_foreign_key "living_conditions", "generic_models", column: "home_type_id"
  add_foreign_key "living_conditions", "generic_models", column: "home_wall_material_id"
  add_foreign_key "living_conditions", "generic_models", column: "rural_production_area_id"
  add_foreign_key "living_conditions", "generic_models", column: "water_supply_id"
  add_foreign_key "living_conditions", "generic_models", column: "water_treatment_id"
  add_foreign_key "permanence_institutions", "companies"
  add_foreign_key "professional_teams", "companies"
  add_foreign_key "registries", "generic_models", column: "person_type_id"
  add_foreign_key "roles", "generic_models", column: "app_module_id"
  add_foreign_key "roles", "roles"
  add_foreign_key "sociodemographic_infos", "companies"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "child_responsible_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "education_level_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "gender_identity_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "job_market_situation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "occupation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "parent_relation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "sexual_orientation_id"
  add_foreign_key "user_companies", "companies"
  add_foreign_key "user_companies", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "user_companies"
  add_foreign_key "users", "health_professionals"
end
