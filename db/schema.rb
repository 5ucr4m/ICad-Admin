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

ActiveRecord::Schema.define(version: 2020_03_09_043806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["discarded_at"], name: "index_addresses_on_discarded_at"
    t.index ["ip"], name: "index_addresses_on_ip"
  end

  create_table "appointment_bookings", force: :cascade do |t|
    t.bigint "health_professional_id"
    t.bigint "family_member_id"
    t.date "appointment_date"
    t.string "start_hour"
    t.string "end_hour"
    t.text "observation"
    t.string "phone"
    t.bigint "medical_procedure_id"
    t.string "slug"
    t.bigint "company_id"
    t.integer "status"
    t.integer "priority"
    t.integer "priority_order"
    t.datetime "discarded_at"
    t.string "ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_appointment_bookings_on_company_id"
    t.index ["discarded_at"], name: "index_appointment_bookings_on_discarded_at"
    t.index ["family_member_id"], name: "index_appointment_bookings_on_family_member_id"
    t.index ["health_professional_id"], name: "index_appointment_bookings_on_health_professional_id"
    t.index ["ip"], name: "index_appointment_bookings_on_ip"
    t.index ["medical_procedure_id"], name: "index_appointment_bookings_on_medical_procedure_id"
  end

  create_table "cancel_registrations", force: :cascade do |t|
    t.bigint "left_reason_id"
    t.date "decease_date"
    t.string "decease_number"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_cancel_registrations_on_company_id"
    t.index ["discarded_at"], name: "index_cancel_registrations_on_discarded_at"
    t.index ["ip"], name: "index_cancel_registrations_on_ip"
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
    t.string "legal_full_name"
    t.string "fancy_name"
    t.string "federal_registry"
    t.string "state_registry"
    t.string "patio"
    t.string "number"
    t.string "zip"
    t.string "reference"
    t.string "district"
    t.bigint "city_id"
    t.string "complement"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "home_registration_id"
    t.date "responsible_birth_date"
    t.string "responsible_cns_number"
    t.integer "members_quantity"
    t.string "handbook_number"
    t.bigint "family_income_id"
    t.date "reside_since"
    t.boolean "moving"
    t.bigint "company_id"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_families_on_company_id"
    t.index ["discarded_at"], name: "index_families_on_discarded_at"
    t.index ["family_income_id"], name: "index_families_on_family_income_id"
    t.index ["home_registration_id"], name: "index_families_on_home_registration_id"
    t.index ["ip"], name: "index_families_on_ip"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "family_member_disabilities", force: :cascade do |t|
    t.bigint "sociodemographic_info_id"
    t.bigint "disability_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_family_member_disabilities_on_company_id"
    t.index ["disability_id"], name: "index_family_member_disabilities_on_disability_id"
    t.index ["discarded_at"], name: "index_family_member_disabilities_on_discarded_at"
    t.index ["ip"], name: "index_family_member_disabilities_on_ip"
    t.index ["sociodemographic_info_id"], name: "index_family_member_disabilities_on_sociodemographic_info_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.bigint "family_id"
    t.string "social_name"
    t.bigint "city_id"
    t.date "birth_date"
    t.boolean "unknown_mother"
    t.string "mother_name"
    t.string "email"
    t.bigint "nationality_id"
    t.string "name"
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
    t.bigint "user_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["birth_country_id"], name: "index_family_members_on_birth_country_id"
    t.index ["city_id"], name: "index_family_members_on_city_id"
    t.index ["company_id"], name: "index_family_members_on_company_id"
    t.index ["discarded_at"], name: "index_family_members_on_discarded_at"
    t.index ["ethnicity_id"], name: "index_family_members_on_ethnicity_id"
    t.index ["family_id"], name: "index_family_members_on_family_id"
    t.index ["gender_id"], name: "index_family_members_on_gender_id"
    t.index ["ip"], name: "index_family_members_on_ip"
    t.index ["nationality_id"], name: "index_family_members_on_nationality_id"
    t.index ["race_id"], name: "index_family_members_on_race_id"
    t.index ["user_id"], name: "index_family_members_on_user_id"
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

  create_table "header_transports", force: :cascade do |t|
    t.bigint "health_professional_id"
    t.datetime "service_at"
    t.bigint "city_id"
    t.bigint "main_lot_form_id"
    t.bigint "shared_lot_form_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["city_id"], name: "index_header_transports_on_city_id"
    t.index ["company_id"], name: "index_header_transports_on_company_id"
    t.index ["discarded_at"], name: "index_header_transports_on_discarded_at"
    t.index ["health_professional_id"], name: "index_header_transports_on_health_professional_id"
    t.index ["ip"], name: "index_header_transports_on_ip"
    t.index ["main_lot_form_id"], name: "index_header_transports_on_main_lot_form_id"
    t.index ["shared_lot_form_id"], name: "index_header_transports_on_shared_lot_form_id"
  end

  create_table "health_condition_hearts", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "disease_type_id"
    t.bigint "company_id"
    t.datetime "discarded_at"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_condition_hearts_on_company_id"
    t.index ["disease_type_id"], name: "index_health_condition_hearts_on_disease_type_id"
    t.index ["health_condition_id"], name: "index_health_condition_hearts_on_health_condition_id"
  end

  create_table "health_condition_kidneys", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "kidney_problem_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_health_condition_kidneys_on_company_id"
    t.index ["discarded_at"], name: "index_health_condition_kidneys_on_discarded_at"
    t.index ["health_condition_id"], name: "index_health_condition_kidneys_on_health_condition_id"
    t.index ["ip"], name: "index_health_condition_kidneys_on_ip"
    t.index ["kidney_problem_id"], name: "index_health_condition_kidneys_on_kidney_problem_id"
  end

  create_table "health_condition_respiratories", force: :cascade do |t|
    t.bigint "health_condition_id"
    t.bigint "disease_type_id"
    t.bigint "company_id"
    t.datetime "discarded_at"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_health_condition_respiratories_on_company_id"
    t.index ["disease_type_id"], name: "index_health_condition_respiratories_on_disease_type_id"
    t.index ["health_condition_id"], name: "index_health_condition_respiratories_on_health_condition_id"
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
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_health_conditions_on_company_id"
    t.index ["discarded_at"], name: "index_health_conditions_on_discarded_at"
    t.index ["ip"], name: "index_health_conditions_on_ip"
    t.index ["weight_situation_id"], name: "index_health_conditions_on_weight_situation_id"
  end

  create_table "health_establishments", force: :cascade do |t|
    t.string "cnes_code"
    t.string "unit_code"
    t.string "legal_full_name"
    t.string "fancy_name"
    t.string "federal_registry"
    t.string "state_registry"
    t.string "manager_full_name"
    t.string "manager_federal_registry"
    t.date "registry_at"
    t.bigint "unit_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_health_establishments_on_company_id"
    t.index ["discarded_at"], name: "index_health_establishments_on_discarded_at"
    t.index ["ip"], name: "index_health_establishments_on_ip"
    t.index ["unit_type_id"], name: "index_health_establishments_on_unit_type_id"
  end

  create_table "health_professionals", force: :cascade do |t|
    t.string "cns_code"
    t.bigint "cbo_code_id"
    t.string "full_name"
    t.string "federal_registry"
    t.string "state_registry"
    t.string "phone"
    t.bigint "professional_team_id"
    t.bigint "user_id"
    t.bigint "gender_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["cbo_code_id"], name: "index_health_professionals_on_cbo_code_id"
    t.index ["company_id"], name: "index_health_professionals_on_company_id"
    t.index ["discarded_at"], name: "index_health_professionals_on_discarded_at"
    t.index ["gender_id"], name: "index_health_professionals_on_gender_id"
    t.index ["ip"], name: "index_health_professionals_on_ip"
    t.index ["professional_team_id"], name: "index_health_professionals_on_professional_team_id"
    t.index ["user_id"], name: "index_health_professionals_on_user_id"
  end

  create_table "home_registration_pets", force: :cascade do |t|
    t.bigint "home_registration_id"
    t.bigint "pet_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_home_registration_pets_on_company_id"
    t.index ["discarded_at"], name: "index_home_registration_pets_on_discarded_at"
    t.index ["home_registration_id"], name: "index_home_registration_pets_on_home_registration_id"
    t.index ["ip"], name: "index_home_registration_pets_on_ip"
    t.index ["pet_type_id"], name: "index_home_registration_pets_on_pet_type_id"
  end

  create_table "home_registrations", force: :cascade do |t|
    t.string "location_x"
    t.string "location_y"
    t.bigint "health_professional_id"
    t.bigint "living_condition_id"
    t.bigint "address_id"
    t.boolean "form_updated"
    t.integer "pet_quantity"
    t.boolean "refuse_registration"
    t.integer "tp_cds_origin"
    t.string "uuid"
    t.string "uuid_form_origin"
    t.string "uuid_form_update"
    t.bigint "home_type_id"
    t.bigint "permanence_institution_id"
    t.boolean "finished"
    t.bigint "company_id"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "service_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["address_id"], name: "index_home_registrations_on_address_id"
    t.index ["company_id"], name: "index_home_registrations_on_company_id"
    t.index ["discarded_at"], name: "index_home_registrations_on_discarded_at"
    t.index ["health_professional_id"], name: "index_home_registrations_on_health_professional_id"
    t.index ["home_type_id"], name: "index_home_registrations_on_home_type_id"
    t.index ["ip"], name: "index_home_registrations_on_ip"
    t.index ["living_condition_id"], name: "index_home_registrations_on_living_condition_id"
    t.index ["permanence_institution_id"], name: "index_home_registrations_on_permanence_institution_id"
    t.index ["user_id"], name: "index_home_registrations_on_user_id"
  end

  create_table "home_visit_forms", force: :cascade do |t|
    t.bigint "home_visit_registration_id"
    t.bigint "turn_id"
    t.string "handbook_number"
    t.string "cns_number"
    t.date "birth_date"
    t.bigint "gender_id"
    t.boolean "other_visit"
    t.bigint "outcome_id"
    t.string "micro_area"
    t.boolean "out_area"
    t.bigint "home_type_id"
    t.string "weight_monitoring"
    t.string "height_monitoring"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "service_at"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_home_visit_forms_on_company_id"
    t.index ["discarded_at"], name: "index_home_visit_forms_on_discarded_at"
    t.index ["gender_id"], name: "index_home_visit_forms_on_gender_id"
    t.index ["home_type_id"], name: "index_home_visit_forms_on_home_type_id"
    t.index ["home_visit_registration_id"], name: "index_home_visit_forms_on_home_visit_registration_id"
    t.index ["ip"], name: "index_home_visit_forms_on_ip"
    t.index ["outcome_id"], name: "index_home_visit_forms_on_outcome_id"
    t.index ["turn_id"], name: "index_home_visit_forms_on_turn_id"
    t.index ["user_id"], name: "index_home_visit_forms_on_user_id"
  end

  create_table "home_visit_reasons", force: :cascade do |t|
    t.bigint "home_visit_form_id"
    t.bigint "reason_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_home_visit_reasons_on_company_id"
    t.index ["discarded_at"], name: "index_home_visit_reasons_on_discarded_at"
    t.index ["home_visit_form_id"], name: "index_home_visit_reasons_on_home_visit_form_id"
    t.index ["ip"], name: "index_home_visit_reasons_on_ip"
    t.index ["reason_id"], name: "index_home_visit_reasons_on_reason_id"
  end

  create_table "home_visit_registrations", force: :cascade do |t|
    t.bigint "family_member_id"
    t.string "uuid"
    t.string "uuid_form_update"
    t.string "tp_cds_origin"
    t.bigint "company_id"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "service_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_home_visit_registrations_on_company_id"
    t.index ["discarded_at"], name: "index_home_visit_registrations_on_discarded_at"
    t.index ["family_member_id"], name: "index_home_visit_registrations_on_family_member_id"
    t.index ["ip"], name: "index_home_visit_registrations_on_ip"
    t.index ["user_id"], name: "index_home_visit_registrations_on_user_id"
  end

  create_table "in_street_hygiene_accesses", force: :cascade do |t|
    t.bigint "in_street_situation_id"
    t.bigint "hygiene_access_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_in_street_hygiene_accesses_on_company_id"
    t.index ["discarded_at"], name: "index_in_street_hygiene_accesses_on_discarded_at"
    t.index ["hygiene_access_id"], name: "index_in_street_hygiene_accesses_on_hygiene_access_id"
    t.index ["in_street_situation_id"], name: "index_in_street_hygiene_accesses_on_in_street_situation_id"
    t.index ["ip"], name: "index_in_street_hygiene_accesses_on_ip"
  end

  create_table "in_street_situation_meals", force: :cascade do |t|
    t.bigint "in_street_situation_id"
    t.bigint "meal_origin_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_in_street_situation_meals_on_company_id"
    t.index ["discarded_at"], name: "index_in_street_situation_meals_on_discarded_at"
    t.index ["in_street_situation_id"], name: "index_in_street_situation_meals_on_in_street_situation_id"
    t.index ["ip"], name: "index_in_street_situation_meals_on_ip"
    t.index ["meal_origin_type_id"], name: "index_in_street_situation_meals_on_meal_origin_type_id"
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
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_in_street_situations_on_company_id"
    t.index ["discarded_at"], name: "index_in_street_situations_on_discarded_at"
    t.index ["ip"], name: "index_in_street_situations_on_ip"
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
    t.string "uuid_form_update"
    t.integer "tp_cds_origin"
    t.datetime "initial_date_hour"
    t.datetime "final_date_hour"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "service_at"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["cancel_registration_id"], name: "index_individual_registrations_on_cancel_registration_id"
    t.index ["company_id"], name: "index_individual_registrations_on_company_id"
    t.index ["discarded_at"], name: "index_individual_registrations_on_discarded_at"
    t.index ["family_member_id"], name: "index_individual_registrations_on_family_member_id"
    t.index ["health_condition_id"], name: "index_individual_registrations_on_health_condition_id"
    t.index ["in_street_situation_id"], name: "index_individual_registrations_on_in_street_situation_id"
    t.index ["ip"], name: "index_individual_registrations_on_ip"
    t.index ["sociodemographic_info_id"], name: "index_individual_registrations_on_sociodemographic_info_id"
    t.index ["user_id"], name: "index_individual_registrations_on_user_id"
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
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["bathroom_drainage_id"], name: "index_living_conditions_on_bathroom_drainage_id"
    t.index ["company_id"], name: "index_living_conditions_on_company_id"
    t.index ["discarded_at"], name: "index_living_conditions_on_discarded_at"
    t.index ["garbage_disposal_id"], name: "index_living_conditions_on_garbage_disposal_id"
    t.index ["home_access_id"], name: "index_living_conditions_on_home_access_id"
    t.index ["home_location_id"], name: "index_living_conditions_on_home_location_id"
    t.index ["home_situation_id"], name: "index_living_conditions_on_home_situation_id"
    t.index ["home_type_id"], name: "index_living_conditions_on_home_type_id"
    t.index ["home_wall_material_id"], name: "index_living_conditions_on_home_wall_material_id"
    t.index ["ip"], name: "index_living_conditions_on_ip"
    t.index ["rural_production_area_id"], name: "index_living_conditions_on_rural_production_area_id"
    t.index ["water_supply_id"], name: "index_living_conditions_on_water_supply_id"
    t.index ["water_treatment_id"], name: "index_living_conditions_on_water_treatment_id"
  end

  create_table "medical_cares", force: :cascade do |t|
    t.bigint "appointment_booking_id"
    t.string "cephalic_perimeter"
    t.string "weight"
    t.string "height"
    t.string "imc"
    t.string "calf_perimeter"
    t.string "blood_pressure"
    t.string "blood_pressure_to"
    t.string "respiratory_rate"
    t.string "heart_rate"
    t.string "temperature"
    t.string "saturation"
    t.string "capillary_blood"
    t.bigint "collected_time_id"
    t.integer "risk_vulnerability"
    t.bigint "user_id"
    t.string "slug"
    t.bigint "company_id"
    t.datetime "discarded_at"
    t.string "ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_booking_id"], name: "index_medical_cares_on_appointment_booking_id"
    t.index ["collected_time_id"], name: "index_medical_cares_on_collected_time_id"
    t.index ["company_id"], name: "index_medical_cares_on_company_id"
    t.index ["user_id"], name: "index_medical_cares_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "substance"
    t.string "laboratory"
    t.string "laboratory_registry"
    t.string "ggrem_code"
    t.string "registry"
    t.string "ean_one"
    t.string "ean_two"
    t.string "ean_three"
    t.string "presentation"
    t.bigint "therapeutic_class_id"
    t.bigint "product_type_id"
    t.bigint "stripe_id"
    t.string "slug"
    t.bigint "company_id"
    t.datetime "discarded_at"
    t.string "ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_medicines_on_company_id"
    t.index ["discarded_at"], name: "index_medicines_on_discarded_at"
    t.index ["ip"], name: "index_medicines_on_ip"
    t.index ["product_type_id"], name: "index_medicines_on_product_type_id"
    t.index ["stripe_id"], name: "index_medicines_on_stripe_id"
    t.index ["therapeutic_class_id"], name: "index_medicines_on_therapeutic_class_id"
  end

  create_table "period_items", force: :cascade do |t|
    t.string "serialized_uuid"
    t.bigint "serialized_type_id"
    t.string "serialized_cnes"
    t.string "ibge_code"
    t.string "serialized_ine"
    t.string "lot_number"
    t.string "sender_counter_key"
    t.string "sender_installation_uuid"
    t.string "sender_federal_registry"
    t.string "sender_legal_name"
    t.string "sender_phone"
    t.string "sender_email"
    t.string "sender_software_version"
    t.string "sender_database_name"
    t.string "origin_counter_key"
    t.string "origin_installation_uuid"
    t.string "origin_federal_registry"
    t.string "origin_legal_name"
    t.string "origin_phone"
    t.string "origin_email"
    t.string "origin_software_version"
    t.string "origin_database_name"
    t.string "app_version"
    t.bigint "period_id"
    t.string "registrable_type"
    t.bigint "registrable_id"
    t.bigint "company_id"
    t.bigint "user_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_period_items_on_company_id"
    t.index ["discarded_at"], name: "index_period_items_on_discarded_at"
    t.index ["ip"], name: "index_period_items_on_ip"
    t.index ["period_id"], name: "index_period_items_on_period_id"
    t.index ["registrable_type", "registrable_id"], name: "index_period_items_on_registrable_type_and_registrable_id"
    t.index ["serialized_type_id"], name: "index_period_items_on_serialized_type_id"
    t.index ["user_id"], name: "index_period_items_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "competence"
    t.date "start_date"
    t.date "end_date"
    t.date "deadline"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_periods_on_company_id"
    t.index ["discarded_at"], name: "index_periods_on_discarded_at"
    t.index ["ip"], name: "index_periods_on_ip"
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
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_permanence_institutions_on_company_id"
    t.index ["discarded_at"], name: "index_permanence_institutions_on_discarded_at"
    t.index ["ip"], name: "index_permanence_institutions_on_ip"
  end

  create_table "professional_teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.bigint "health_establishment_id"
    t.string "slug"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_professional_teams_on_company_id"
    t.index ["discarded_at"], name: "index_professional_teams_on_discarded_at"
    t.index ["health_establishment_id"], name: "index_professional_teams_on_health_establishment_id"
    t.index ["ip"], name: "index_professional_teams_on_ip"
  end

  create_table "responsible_children", force: :cascade do |t|
    t.bigint "individual_registration_id"
    t.bigint "responsible_child_type_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_responsible_children_on_company_id"
    t.index ["discarded_at"], name: "index_responsible_children_on_discarded_at"
    t.index ["individual_registration_id"], name: "index_responsible_children_on_individual_registration_id"
    t.index ["ip"], name: "index_responsible_children_on_ip"
    t.index ["responsible_child_type_id"], name: "index_responsible_children_on_responsible_child_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "role_type"
    t.boolean "admin"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sms_messages", force: :cascade do |t|
    t.datetime "date_sent"
    t.string "number"
    t.integer "status"
    t.bigint "sms_schedule_id"
    t.string "slug"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_sms_messages_on_company_id"
    t.index ["discarded_at"], name: "index_sms_messages_on_discarded_at"
    t.index ["ip"], name: "index_sms_messages_on_ip"
    t.index ["sms_schedule_id"], name: "index_sms_messages_on_sms_schedule_id"
  end

  create_table "sms_schedules", force: :cascade do |t|
    t.string "name"
    t.datetime "scheduled_date"
    t.text "message"
    t.string "role_groups"
    t.integer "status"
    t.string "slug"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_sms_schedules_on_company_id"
    t.index ["discarded_at"], name: "index_sms_schedules_on_discarded_at"
    t.index ["ip"], name: "index_sms_schedules_on_ip"
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
    t.boolean "has_any_disability"
    t.boolean "desire_gender"
    t.bigint "gender_identity_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_sociodemographic_infos_on_company_id"
    t.index ["discarded_at"], name: "index_sociodemographic_infos_on_discarded_at"
    t.index ["education_level_id"], name: "index_sociodemographic_infos_on_education_level_id"
    t.index ["gender_identity_id"], name: "index_sociodemographic_infos_on_gender_identity_id"
    t.index ["ip"], name: "index_sociodemographic_infos_on_ip"
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
    t.bigint "country_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.bigint "role_id"
    t.boolean "current_company", default: true
    t.integer "current_module"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_user_roles_on_company_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
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
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vaccination_campaigns", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "period_start"
    t.date "period_end"
    t.integer "age_initial"
    t.integer "age_end"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_vaccination_campaigns_on_company_id"
    t.index ["discarded_at"], name: "index_vaccination_campaigns_on_discarded_at"
    t.index ["ip"], name: "index_vaccination_campaigns_on_ip"
  end

  create_table "vaccination_vaccines", force: :cascade do |t|
    t.bigint "vaccination_id"
    t.bigint "vaccine_id"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_vaccination_vaccines_on_company_id"
    t.index ["discarded_at"], name: "index_vaccination_vaccines_on_discarded_at"
    t.index ["ip"], name: "index_vaccination_vaccines_on_ip"
    t.index ["vaccination_id"], name: "index_vaccination_vaccines_on_vaccination_id"
    t.index ["vaccine_id"], name: "index_vaccination_vaccines_on_vaccine_id"
  end

  create_table "vaccinations", force: :cascade do |t|
    t.string "uuid"
    t.string "tp_cds_origin"
    t.integer "patient_type"
    t.bigint "header_transport_id"
    t.bigint "vaccination_campaign_id"
    t.bigint "turn_id"
    t.bigint "family_member_id"
    t.bigint "local_service_id"
    t.boolean "traveller"
    t.boolean "leprosy_communicant"
    t.boolean "pregnant"
    t.boolean "puerperal"
    t.datetime "initial_date_hour"
    t.datetime "final_date_hour"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "service_at"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_vaccinations_on_company_id"
    t.index ["discarded_at"], name: "index_vaccinations_on_discarded_at"
    t.index ["family_member_id"], name: "index_vaccinations_on_family_member_id"
    t.index ["header_transport_id"], name: "index_vaccinations_on_header_transport_id"
    t.index ["ip"], name: "index_vaccinations_on_ip"
    t.index ["local_service_id"], name: "index_vaccinations_on_local_service_id"
    t.index ["turn_id"], name: "index_vaccinations_on_turn_id"
    t.index ["user_id"], name: "index_vaccinations_on_user_id"
    t.index ["vaccination_campaign_id"], name: "index_vaccinations_on_vaccination_campaign_id"
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "description"
    t.bigint "immunobiological_id"
    t.bigint "vaccination_strategy_id"
    t.bigint "dose_id"
    t.string "lot_number"
    t.string "manufacturer"
    t.bigint "company_id"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "ip"
    t.index ["company_id"], name: "index_vaccines_on_company_id"
    t.index ["discarded_at"], name: "index_vaccines_on_discarded_at"
    t.index ["dose_id"], name: "index_vaccines_on_dose_id"
    t.index ["immunobiological_id"], name: "index_vaccines_on_immunobiological_id"
    t.index ["ip"], name: "index_vaccines_on_ip"
    t.index ["vaccination_strategy_id"], name: "index_vaccines_on_vaccination_strategy_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.string "ip"
    t.string "user_agent"
    t.string "company_id"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "generic_models", column: "address_type_id"
  add_foreign_key "appointment_bookings", "companies"
  add_foreign_key "appointment_bookings", "family_members"
  add_foreign_key "appointment_bookings", "generic_models", column: "medical_procedure_id"
  add_foreign_key "appointment_bookings", "health_professionals"
  add_foreign_key "cancel_registrations", "companies"
  add_foreign_key "cancel_registrations", "generic_models", column: "left_reason_id"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities"
  add_foreign_key "families", "companies"
  add_foreign_key "families", "generic_models", column: "family_income_id"
  add_foreign_key "families", "home_registrations"
  add_foreign_key "families", "users"
  add_foreign_key "family_member_disabilities", "companies"
  add_foreign_key "family_member_disabilities", "generic_models", column: "disability_id"
  add_foreign_key "family_member_disabilities", "sociodemographic_infos"
  add_foreign_key "family_members", "cities"
  add_foreign_key "family_members", "companies"
  add_foreign_key "family_members", "families"
  add_foreign_key "family_members", "generic_models", column: "birth_country_id"
  add_foreign_key "family_members", "generic_models", column: "ethnicity_id"
  add_foreign_key "family_members", "generic_models", column: "gender_id"
  add_foreign_key "family_members", "generic_models", column: "nationality_id"
  add_foreign_key "family_members", "generic_models", column: "race_id"
  add_foreign_key "family_members", "users"
  add_foreign_key "generic_models", "generic_models"
  add_foreign_key "header_transports", "cities"
  add_foreign_key "header_transports", "companies"
  add_foreign_key "header_transports", "header_transports", column: "main_lot_form_id"
  add_foreign_key "header_transports", "header_transports", column: "shared_lot_form_id"
  add_foreign_key "header_transports", "health_professionals"
  add_foreign_key "health_condition_hearts", "companies"
  add_foreign_key "health_condition_hearts", "generic_models", column: "disease_type_id"
  add_foreign_key "health_condition_hearts", "health_conditions"
  add_foreign_key "health_condition_kidneys", "companies"
  add_foreign_key "health_condition_kidneys", "generic_models", column: "kidney_problem_id"
  add_foreign_key "health_condition_kidneys", "health_conditions"
  add_foreign_key "health_condition_respiratories", "companies"
  add_foreign_key "health_condition_respiratories", "generic_models", column: "disease_type_id"
  add_foreign_key "health_condition_respiratories", "health_conditions"
  add_foreign_key "health_conditions", "companies"
  add_foreign_key "health_conditions", "generic_models", column: "weight_situation_id"
  add_foreign_key "health_establishments", "companies"
  add_foreign_key "health_establishments", "generic_models", column: "unit_type_id"
  add_foreign_key "health_professionals", "companies"
  add_foreign_key "health_professionals", "generic_models", column: "cbo_code_id"
  add_foreign_key "health_professionals", "generic_models", column: "gender_id"
  add_foreign_key "health_professionals", "professional_teams"
  add_foreign_key "health_professionals", "users"
  add_foreign_key "home_registration_pets", "companies"
  add_foreign_key "home_registration_pets", "generic_models", column: "pet_type_id"
  add_foreign_key "home_registration_pets", "home_registrations"
  add_foreign_key "home_registrations", "addresses"
  add_foreign_key "home_registrations", "companies"
  add_foreign_key "home_registrations", "generic_models", column: "home_type_id"
  add_foreign_key "home_registrations", "health_professionals"
  add_foreign_key "home_registrations", "living_conditions"
  add_foreign_key "home_registrations", "permanence_institutions"
  add_foreign_key "home_registrations", "users"
  add_foreign_key "home_visit_forms", "companies"
  add_foreign_key "home_visit_forms", "generic_models", column: "gender_id"
  add_foreign_key "home_visit_forms", "generic_models", column: "home_type_id"
  add_foreign_key "home_visit_forms", "generic_models", column: "outcome_id"
  add_foreign_key "home_visit_forms", "generic_models", column: "turn_id"
  add_foreign_key "home_visit_forms", "home_visit_registrations"
  add_foreign_key "home_visit_forms", "users"
  add_foreign_key "home_visit_reasons", "companies"
  add_foreign_key "home_visit_reasons", "generic_models", column: "reason_id"
  add_foreign_key "home_visit_reasons", "home_visit_forms"
  add_foreign_key "home_visit_registrations", "companies"
  add_foreign_key "home_visit_registrations", "family_members"
  add_foreign_key "home_visit_registrations", "users"
  add_foreign_key "in_street_hygiene_accesses", "companies"
  add_foreign_key "in_street_hygiene_accesses", "generic_models", column: "hygiene_access_id"
  add_foreign_key "in_street_hygiene_accesses", "in_street_situations"
  add_foreign_key "in_street_situation_meals", "companies"
  add_foreign_key "in_street_situation_meals", "generic_models", column: "meal_origin_type_id"
  add_foreign_key "in_street_situation_meals", "in_street_situations"
  add_foreign_key "in_street_situations", "companies"
  add_foreign_key "in_street_situations", "generic_models", column: "meals_per_day_id"
  add_foreign_key "in_street_situations", "generic_models", column: "street_situation_time_id"
  add_foreign_key "individual_registrations", "cancel_registrations"
  add_foreign_key "individual_registrations", "companies"
  add_foreign_key "individual_registrations", "family_members"
  add_foreign_key "individual_registrations", "health_conditions"
  add_foreign_key "individual_registrations", "in_street_situations"
  add_foreign_key "individual_registrations", "sociodemographic_infos"
  add_foreign_key "individual_registrations", "users"
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
  add_foreign_key "medical_cares", "appointment_bookings"
  add_foreign_key "medical_cares", "companies"
  add_foreign_key "medical_cares", "generic_models", column: "collected_time_id"
  add_foreign_key "medical_cares", "users"
  add_foreign_key "medicines", "companies"
  add_foreign_key "medicines", "generic_models", column: "product_type_id"
  add_foreign_key "medicines", "generic_models", column: "stripe_id"
  add_foreign_key "medicines", "generic_models", column: "therapeutic_class_id"
  add_foreign_key "period_items", "companies"
  add_foreign_key "period_items", "generic_models", column: "serialized_type_id"
  add_foreign_key "period_items", "periods"
  add_foreign_key "period_items", "users"
  add_foreign_key "periods", "companies"
  add_foreign_key "permanence_institutions", "companies"
  add_foreign_key "professional_teams", "companies"
  add_foreign_key "professional_teams", "health_establishments"
  add_foreign_key "responsible_children", "companies"
  add_foreign_key "responsible_children", "generic_models", column: "responsible_child_type_id"
  add_foreign_key "responsible_children", "individual_registrations"
  add_foreign_key "sms_messages", "companies"
  add_foreign_key "sms_messages", "sms_schedules"
  add_foreign_key "sms_schedules", "companies"
  add_foreign_key "sociodemographic_infos", "companies"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "education_level_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "gender_identity_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "job_market_situation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "occupation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "parent_relation_id"
  add_foreign_key "sociodemographic_infos", "generic_models", column: "sexual_orientation_id"
  add_foreign_key "states", "generic_models", column: "country_id"
  add_foreign_key "taggings", "tags"
  add_foreign_key "user_roles", "companies"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "vaccination_campaigns", "companies"
  add_foreign_key "vaccination_vaccines", "companies"
  add_foreign_key "vaccination_vaccines", "vaccinations"
  add_foreign_key "vaccination_vaccines", "vaccines"
  add_foreign_key "vaccinations", "companies"
  add_foreign_key "vaccinations", "family_members"
  add_foreign_key "vaccinations", "generic_models", column: "local_service_id"
  add_foreign_key "vaccinations", "generic_models", column: "turn_id"
  add_foreign_key "vaccinations", "header_transports"
  add_foreign_key "vaccinations", "users"
  add_foreign_key "vaccinations", "vaccination_campaigns"
  add_foreign_key "vaccines", "companies"
  add_foreign_key "vaccines", "generic_models", column: "dose_id"
  add_foreign_key "vaccines", "generic_models", column: "immunobiological_id"
  add_foreign_key "vaccines", "generic_models", column: "vaccination_strategy_id"
end
