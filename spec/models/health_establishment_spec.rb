# == Schema Information
#
# Table name: health_establishments
#
#  id           :bigint           not null, primary key
#  cnes_code    :string
#  registry_at  :date
#  slug         :string
#  unit_code    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint
#  manager_id   :bigint
#  registry_id  :bigint
#  unit_type_id :bigint
#
# Indexes
#
#  index_health_establishments_on_company_id    (company_id)
#  index_health_establishments_on_manager_id    (manager_id)
#  index_health_establishments_on_registry_id   (registry_id)
#  index_health_establishments_on_unit_type_id  (unit_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (manager_id => registries.id)
#  fk_rails_...  (registry_id => registries.id)
#  fk_rails_...  (unit_type_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe HealthEstablishment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
