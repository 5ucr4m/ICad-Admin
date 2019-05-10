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

FactoryBot.define do
  factory :sociodemographic_info do
    has_disabilities { false }
    citizen_disabilities { "MyText" }
    education_level { nil }
    exit_reason { nil }
    sexual_orientation { nil }
    traditional_community { "MyString" }
    parent_relation { nil }
    child_responsible { 1 }
    job_market_situation { nil }
    desire_sexual_orientation { false }
    attend_folk_healer { false }
    has_traditional_community { false }
    community_group { false }
    has_health_plan { false }
    company { nil }
    slug { "MyString" }
  end
end
