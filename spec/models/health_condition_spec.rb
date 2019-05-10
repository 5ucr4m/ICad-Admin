# == Schema Information
#
# Table name: health_conditions
#
#  id                          :bigint           not null, primary key
#  alcohol_dependent           :boolean
#  avc_stroke                  :boolean
#  bedridden                   :boolean
#  diabetic                    :boolean
#  domiciled                   :boolean
#  had_heart_attack            :boolean
#  had_heart_disease           :boolean
#  hospitalization_cause       :text
#  integrative_practices       :boolean
#  leprosy                     :boolean
#  maternity_reference         :string
#  medicinal_plants            :boolean
#  medicinal_plants_used       :text
#  mental_issue                :boolean
#  other_drugs_dependent       :boolean
#  pregnant                    :boolean
#  recently_hospitalized       :boolean
#  recently_hospitalized_cause :text
#  slug                        :string
#  smoker                      :boolean
#  tuberculosis                :boolean
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  company_id                  :bigint
#  weight_situation_id         :bigint
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

require 'rails_helper'

RSpec.describe HealthCondition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
