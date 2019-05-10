# frozen_string_literal: true

# == Schema Information
#
# Table name: individual_registrations
#
#  id                       :bigint           not null, primary key
#  form_updated             :boolean
#  refuse_registration      :boolean
#  slug                     :string
#  uuid                     :string
#  uuid_form_origin         :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  citizen_id               :bigint
#  company_id               :bigint
#  health_condition_id      :bigint
#  sociodemographic_info_id :bigint
#  street_situation_id      :bigint
#  tb_cds_origin_id         :bigint
#
# Indexes
#
#  index_individual_registrations_on_citizen_id                (citizen_id)
#  index_individual_registrations_on_company_id                (company_id)
#  index_individual_registrations_on_health_condition_id       (health_condition_id)
#  index_individual_registrations_on_sociodemographic_info_id  (sociodemographic_info_id)
#  index_individual_registrations_on_street_situation_id       (street_situation_id)
#  index_individual_registrations_on_tb_cds_origin_id          (tb_cds_origin_id)
#
# Foreign Keys
#
#  fk_rails_...  (citizen_id => citizens.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#  fk_rails_...  (sociodemographic_info_id => sociodemographic_infos.id)
#  fk_rails_...  (street_situation_id => street_situations.id)
#  fk_rails_...  (tb_cds_origin_id => generic_models.id)
#


class IndividualRegistration < ApplicationRecord
  include Sluggable

  belongs_to :citizen
  belongs_to :health_condition
  belongs_to :street_situation
  belongs_to :sociodemographic_info
  belongs_to :tb_cds_origin, class_name: 'GenericModel'
  belongs_to :company

  ransack_alias :search, :id_to_s
end
