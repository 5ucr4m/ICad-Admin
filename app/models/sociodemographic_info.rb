# frozen_string_literal: true

# == Schema Information
#
# Table name: sociodemographic_infos
#
#  id                        :bigint           not null, primary key
#  attend_folk_healer        :boolean
#  child_responsible         :integer
#  citizen_disabilities      :text
#  community_group           :boolean
#  desire_sexual_orientation :boolean
#  has_disabilities          :boolean
#  has_health_plan           :boolean
#  has_traditional_community :boolean
#  slug                      :string
#  traditional_community     :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  company_id                :bigint
#  education_level_id        :bigint
#  exit_reason_id            :bigint
#  job_market_situation_id   :bigint
#  parent_relation_id        :bigint
#  sexual_orientation_id     :bigint
#
# Indexes
#
#  index_sociodemographic_infos_on_company_id               (company_id)
#  index_sociodemographic_infos_on_education_level_id       (education_level_id)
#  index_sociodemographic_infos_on_exit_reason_id           (exit_reason_id)
#  index_sociodemographic_infos_on_job_market_situation_id  (job_market_situation_id)
#  index_sociodemographic_infos_on_parent_relation_id       (parent_relation_id)
#  index_sociodemographic_infos_on_sexual_orientation_id    (sexual_orientation_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (education_level_id => generic_models.id)
#  fk_rails_...  (exit_reason_id => generic_models.id)
#  fk_rails_...  (job_market_situation_id => generic_models.id)
#  fk_rails_...  (parent_relation_id => generic_models.id)
#  fk_rails_...  (sexual_orientation_id => generic_models.id)
#


class SociodemographicInfo < ApplicationRecord
  include Sluggable

  belongs_to :education_level, class_name: 'GenericModel'
  belongs_to :exit_reason, class_name: 'GenericModel'
  belongs_to :sexual_orientation, class_name: 'GenericModel'
  belongs_to :parent_relation, class_name: 'GenericModel'
  belongs_to :job_market_situation, class_name: 'GenericModel'
  belongs_to :company

  ransack_alias :search, :id_to_s
end
