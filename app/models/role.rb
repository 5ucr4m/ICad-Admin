# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  has_many :users

  enum role_type: %i[admin mayor secretary doctor nurse nurse_aux agent dentist dentist_aux]

  ransack_alias :search, :id_to_s
end
