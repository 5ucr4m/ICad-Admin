# == Schema Information
#
# Table name: other_health_conditions
#
#  id                       :bigint           not null, primary key
#  description              :text
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint
#  health_condition_id      :bigint
#  health_condition_type_id :bigint
#
# Indexes
#
#  index_other_health_conditions_on_company_id                (company_id)
#  index_other_health_conditions_on_health_condition_id       (health_condition_id)
#  index_other_health_conditions_on_health_condition_type_id  (health_condition_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#  fk_rails_...  (health_condition_type_id => generic_models.id)
#

class OtherHealthCondition < ApplicationRecord

  belongs_to :health_condition, optional: true
  belongs_to :health_condition_type, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
