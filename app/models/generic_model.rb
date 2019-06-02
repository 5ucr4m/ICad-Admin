# frozen_string_literal: true

# == Schema Information
#
# Table name: generic_models
#
#  id               :bigint           not null, primary key
#  description      :string
#  generic_class    :string
#  generic_field    :string
#  name             :string
#  reference        :string
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  generic_model_id :bigint
#
# Indexes
#
#  index_generic_models_on_generic_model_id  (generic_model_id)
#
# Foreign Keys
#
#  fk_rails_...  (generic_model_id => generic_models.id)
#

class GenericModel < ApplicationRecord
  include Sluggable

  belongs_to :generic_model, optional: true

  ransack_alias :search, :id_to_s_or_name_or_reference

  scope :app_modules, -> {where(generic_field: :app_module)}
  scope :nationalities, -> {where(generic_field: :nationality)}
  scope :races, -> {where(generic_field: :race)}
  scope :genders, -> {where(generic_field: :gender)}
  scope :ethnicities, -> {where(generic_field: :ethnicity)}
  scope :countries, -> {where(generic_field: :country)}
  scope :address_types, -> {where(generic_field: :address_type)}
  scope :water_supplies, -> {where(generic_field: :water_supply)}
  scope :rural_production_areas, -> {where(generic_field: :rural_production_area)}
  scope :garbage_disposals, -> {where(generic_field: :garbage_disposal)}
  scope :bathroom_drainage, -> {where(generic_field: :bathroom_drainage)}
  scope :home_wall_materials, -> {where(generic_field: :home_wall_material)}
  scope :home_locations, ->{where(generic_field: :home_location)}
  scope :home_situations, -> {where(generic_field: :home_situation)}
  scope :hygiene_access, ->{where(generic_field: :hygiene_access)}
  scope :home_accesses, -> {where(generic_field: :home_access)}
  scope :home_types, -> {where(generic_field: :home_type)}
  scope :residence_types, -> {where(generic_field: :residence_type)}
  scope :water_treatments, -> {where(generic_field: :water_treatment)}
  scope :pet_types, -> {where(generic_field: :pet_type)}
  scope :unit_types, ->{where(generic_field: :unit_type)}
  scope :cbo_types, ->{where(generic_field: :cbo_type)}
  scope :breastfeeding, ->{where(generic_field: :breastfeeding)}
  scope :weight_situations, ->{where(generic_field: :weight_situation_type)}
  scope :meals_per_day, ->{where(generic_field: :meals_quantity_type)}
  scope :street_situation_time, ->{where(generic_field: :street_situation_time)}
  scope :meals_origin_types, ->{where(generic_field: :meals_origin_type)}
  scope :respiratory_diseases, -> {where(generic_field: :respiratory_disease)}
  scope :kidney_problems, -> {where(generic_field: :kidney_problem)}
  scope :turns, -> {where(generic_field: :turn)}
  scope :outcomes, ->{where(generic_field: :outcome)}
  scope :visit_reasons, ->{where(generic_field: :reason)}
  scope :sexual_orientations, ->{where(generic_field: :sexual_orientation)}
  scope :education_levels, ->{where(generic_field: :education_level)}
  scope :parent_relations, ->{where(generic_field: :parent_relation)}
  scope :job_market_situations, ->{where(generic_field: :job_market_situation)}
  scope :child_responsible, ->{where(generic_field: :child_responsible)}
  scope :left_reasons, ->{where(generic_field: :left_reason)}

  def name_formatted
    return name.mb_chars.upcase if reference.blank?

    "#{reference} - #{name.mb_chars.upcase}"
  end
end
