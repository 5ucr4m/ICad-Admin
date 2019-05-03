# == Schema Information
#
# Table name: cities
#
#  id           :bigint           not null, primary key
#  abbreviation :string
#  code         :string
#  name         :string
#  reference    :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state_id     :bigint
#
# Indexes
#
#  index_cities_on_state_id  (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (state_id => states.id)
#

class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation, :code, :reference, :slug
  has_one :state
end
