# frozen_string_literal: true

# == Schema Information
#
# Table name: individual_registrations
#
#  id                       :bigint           not null, primary key
#  form_updated             :boolean
#  refuse_registration      :boolean
#  slug                     :string
#  tp_cds_origin            :integer
#  uuid                     :string
#  uuid_citizen             :string
#  uuid_form_origin         :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  cancel_registration_id   :bigint
#  company_id               :bigint
#  family_member_id         :bigint
#  health_condition_id      :bigint
#  in_street_situation_id   :bigint
#  sociodemographic_info_id :bigint
#
# Indexes
#
#  index_individual_registrations_on_cancel_registration_id    (cancel_registration_id)
#  index_individual_registrations_on_company_id                (company_id)
#  index_individual_registrations_on_family_member_id          (family_member_id)
#  index_individual_registrations_on_health_condition_id       (health_condition_id)
#  index_individual_registrations_on_in_street_situation_id    (in_street_situation_id)
#  index_individual_registrations_on_sociodemographic_info_id  (sociodemographic_info_id)
#
# Foreign Keys
#
#  fk_rails_...  (cancel_registration_id => cancel_registrations.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_member_id => family_members.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#  fk_rails_...  (in_street_situation_id => in_street_situations.id)
#  fk_rails_...  (sociodemographic_info_id => sociodemographic_infos.id)
#

class IndividualRegistration < ApplicationRecord
  include Sluggable

  belongs_to :health_condition, optional: true
  belongs_to :in_street_situation, optional: true
  belongs_to :family_member
  belongs_to :sociodemographic_info, optional: true
  belongs_to :cancel_registration, optional: true
  belongs_to :company, optional: true

  accepts_nested_attributes_for :health_condition, allow_destroy: false
  accepts_nested_attributes_for :in_street_situation, allow_destroy: false
  accepts_nested_attributes_for :sociodemographic_info, allow_destroy: false
  accepts_nested_attributes_for :cancel_registration, allow_destroy: false

  ransack_alias :search, :id_to_s

  def build_relationships
    build_health_condition
    build_in_street_situation
    build_sociodemographic_info
    build_cancel_registration
  end
end
