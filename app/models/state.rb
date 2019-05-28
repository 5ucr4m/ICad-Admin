# frozen_string_literal: true

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

class State < ApplicationRecord
  include Sluggable

  belongs_to :country, class_name: 'GenericModel', optional: true

  ransack_alias :search, :id_to_s

  has_many :cities, dependent: :nullify

  def name_formatted
    "#{name} - #{abbreviation}"
  end
end
