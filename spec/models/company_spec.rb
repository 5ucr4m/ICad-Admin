# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  complement       :string
#  district         :string
#  fancy_name       :string
#  federal_registry :string
#  legal_full_name  :string
#  number           :string
#  patio            :string
#  reference        :string
#  slug             :string
#  state_registry   :string
#  zip              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :bigint
#
# Indexes
#
#  index_companies_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
