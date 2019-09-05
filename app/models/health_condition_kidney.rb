# frozen_string_literal: true

# == Schema Information
#
# Table name: health_condition_kidneys
#
#  id                  :bigint           not null, primary key
#  slug                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  health_condition_id :bigint
#  kidney_problem_id   :bigint
#
# Indexes
#
#  index_health_condition_kidneys_on_company_id           (company_id)
#  index_health_condition_kidneys_on_health_condition_id  (health_condition_id)
#  index_health_condition_kidneys_on_kidney_problem_id    (kidney_problem_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#  fk_rails_...  (kidney_problem_id => generic_models.id)
#

class HealthConditionKidney < ApplicationRecord
  belongs_to :health_condition, optional: true
  belongs_to :kidney_problem, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
