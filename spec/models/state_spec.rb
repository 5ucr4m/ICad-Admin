# == Schema Information
#
# Table name: states
#
#  id           :bigint           not null, primary key
#  abbreviation :string
#  code         :string
#  name         :string
#  reference    :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  country_id   :bigint
#
# Indexes
#
#  index_states_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe State, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
