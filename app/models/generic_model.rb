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

  ransack_alias :search, :id_to_s_or_name

  scope :app_modules, -> {where(generic_class: Role.to_s, generic_field: :app_module)}
  scope :nationalities, -> {where(generic_class: FamilyMember.to_s, generic_field: :nationality)}
  scope :races, -> {where(generic_class: FamilyMember.to_s, generic_field: :race)}
  scope :genders, -> {where(generic_class: FamilyMember.to_s, generic_field: :gender)}
  scope :ethnicities, -> {where(generic_class: FamilyMember.to_s, generic_field: :ethnicity)}
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
  scope :cbo_codes, ->{where(generic_field: :cbo_code)}
  scope :breastfeeding, ->{where(generic_field: :breastfeeding)}

  def name_formatted
    return name if reference.blank?

    "#{reference} - #{name}"
  end
end
