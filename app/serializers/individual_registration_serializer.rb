# frozen_string_literal: true

# == Schema Information
#
# Table name: individual_registrations
#
#  id                       :bigint           not null, primary key
#  final_date_hour          :datetime
#  form_updated             :boolean
#  initial_date_hour        :datetime
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

class IndividualRegistrationSerializer < ApplicationSerializer
  attributes :id, :refuse_registration, :form_updated, :uuid, :uuid_form_origin, :uuid_citizen, :tp_cds_origin, :slug
  has_one :health_condition
  has_one :in_street_situation
  has_one :family_member
  has_one :sociodemographic_info
  has_one :cancel_registration
  has_one :company

  def id
    object.slug
  end
end
