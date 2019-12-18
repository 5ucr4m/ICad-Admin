# frozen_string_literal: true

# == Schema Information
#
# Table name: health_conditions
#
#  id                    :bigint           not null, primary key
#  alcohol_dependent     :boolean
#  avc_stroke            :boolean
#  bedridden             :boolean
#  cancer                :boolean
#  diabetic              :boolean
#  domiciled             :boolean
#  had_heart_attack      :boolean
#  had_heart_disease     :boolean
#  hospitalization_cause :text
#  hypertension          :boolean
#  integrative_practices :boolean
#  kidneys               :boolean
#  leprosy               :boolean
#  maternity_reference   :string
#  medicinal_plants      :boolean
#  medicinal_plants_used :text
#  mental_issue          :boolean
#  other_condition_one   :text
#  other_condition_three :text
#  other_condition_two   :text
#  other_drugs_dependent :boolean
#  pregnant              :boolean
#  recently_hospitalized :boolean
#  respiratory           :boolean
#  slug                  :string
#  smoker                :boolean
#  tuberculosis          :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  company_id            :bigint
#  weight_situation_id   :bigint
#
# Indexes
#
#  index_health_conditions_on_company_id           (company_id)
#  index_health_conditions_on_weight_situation_id  (weight_situation_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (weight_situation_id => generic_models.id)
#

class HealthCondition < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :weight_situation, class_name: 'GenericModel'
  belongs_to :company, optional: true

  has_many :health_condition_kidneys, dependent: :destroy
  has_many :health_condition_hearts, dependent: :destroy
  has_many :health_condition_respiratories, dependent: :destroy

  has_one :individual_registration, dependent: :destroy

  accepts_nested_attributes_for :health_condition_kidneys, allow_destroy: true
  accepts_nested_attributes_for :health_condition_hearts, allow_destroy: true
  accepts_nested_attributes_for :health_condition_respiratories, allow_destroy: true

  ransack_alias :search, :id_to_s
end
