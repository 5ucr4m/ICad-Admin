# frozen_string_literal: true

# == Schema Information
#
# Table name: states
#
#  id           :bigint           not null, primary key
#  name         :string
#  abbreviation :string
#  code         :string
#  reference    :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class State < ApplicationRecord
  include Sluggable

  has_many :cities, dependent: :destroy

  ransack_alias :search, :id_to_s

  def name_formatted
    "#{name} - #{abbreviation}"
  end
end
