# == Schema Information
#
# Table name: registries
#
#  id               :bigint           not null, primary key
#  fancy_name       :string
#  federal_registry :string
#  legal_full_name  :string
#  slug             :string
#  social_name      :string
#  state_registry   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  person_type_id   :bigint
#
# Indexes
#
#  index_registries_on_person_type_id  (person_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_type_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe Registry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
