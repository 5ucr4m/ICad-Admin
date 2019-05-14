# == Schema Information
#
# Table name: sociodemographic_infos
#
#  id                         :bigint           not null, primary key
#  attend_folk_healer         :boolean
#  attend_school              :boolean
#  community_group            :boolean
#  desire_gender              :boolean
#  desire_orientation         :boolean
#  health_plan                :boolean
#  slug                       :string
#  traditional_community      :boolean
#  traditional_community_name :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  child_responsible_id       :bigint
#  company_id                 :bigint
#  education_level_id         :bigint
#  gender_identity_id         :bigint
#  job_market_situation_id    :bigint
#  occupation_id              :bigint
#  parent_relation_id         :bigint
#  sexual_orientation_id      :bigint
#
# Indexes
#
#  index_sociodemographic_infos_on_child_responsible_id     (child_responsible_id)
#  index_sociodemographic_infos_on_company_id               (company_id)
#  index_sociodemographic_infos_on_education_level_id       (education_level_id)
#  index_sociodemographic_infos_on_gender_identity_id       (gender_identity_id)
#  index_sociodemographic_infos_on_job_market_situation_id  (job_market_situation_id)
#  index_sociodemographic_infos_on_occupation_id            (occupation_id)
#  index_sociodemographic_infos_on_parent_relation_id       (parent_relation_id)
#  index_sociodemographic_infos_on_sexual_orientation_id    (sexual_orientation_id)
#
# Foreign Keys
#
#  fk_rails_...  (child_responsible_id => generic_models.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (education_level_id => generic_models.id)
#  fk_rails_...  (gender_identity_id => generic_models.id)
#  fk_rails_...  (job_market_situation_id => generic_models.id)
#  fk_rails_...  (occupation_id => generic_models.id)
#  fk_rails_...  (parent_relation_id => generic_models.id)
#  fk_rails_...  (sexual_orientation_id => generic_models.id)
#

class SociodemographicInfo < ApplicationRecord

  belongs_to :education_level, optional: true
  belongs_to :occupation, optional: true
  belongs_to :sexual_orientation, optional: true
  belongs_to :parent_relation, optional: true
  belongs_to :job_market_situation, optional: true
  belongs_to :gender_identity, optional: true
  belongs_to :child_responsible, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
