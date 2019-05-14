# == Schema Information
#
# Table name: health_condition_diseases
#
#  id                  :bigint           not null, primary key
#  slug                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  disease_type_id     :bigint
#  health_condition_id :bigint
#
# Indexes
#
#  index_health_condition_diseases_on_company_id           (company_id)
#  index_health_condition_diseases_on_disease_type_id      (disease_type_id)
#  index_health_condition_diseases_on_health_condition_id  (health_condition_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (disease_type_id => generic_models.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#

require 'rails_helper'

RSpec.describe HealthConditionDisease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
