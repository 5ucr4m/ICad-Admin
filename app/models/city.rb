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

class City < ApplicationRecord
  include Sluggable

  belongs_to :state, optional: true

  ransack_alias :search, :id_to_s
end
