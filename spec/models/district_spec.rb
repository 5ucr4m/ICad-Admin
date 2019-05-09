# == Schema Information
#
# Table name: districts
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint
#  zone_id    :bigint
#
# Indexes
#
#  index_districts_on_city_id  (city_id)
#  index_districts_on_zone_id  (zone_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (zone_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe District, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
