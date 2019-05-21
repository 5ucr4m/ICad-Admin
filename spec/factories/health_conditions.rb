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

FactoryBot.define do
  factory :health_condition do
    hospitalization_cause { 'MyText' }
    other_condition_one { 'MyText' }
    other_condition_two { 'MyText' }
    other_condition_three { 'MyText' }
    medicinal_plants_used { 'MyText' }
    maternity_reference { 'MyString' }
    weight_situation { nil }
    alcohol_dependent { false }
    other_drugs_dependent { false }
    smoker { false }
    pregnant { false }
    bedridden { false }
    domiciled { false }
    diabetic { false }
    respiratory { false }
    hypertension { false }
    cancer { false }
    kidneys { false }
    leprosy { false }
    tuberculosis { false }
    avc_stroke { false }
    had_heart_attack { false }
    had_heart_disease { false }
    recently_hospitalized { false }
    mental_issue { false }
    integrative_practices { false }
    medicinal_plants { false }
    company { nil }
    slug { 'MyString' }
  end
end
