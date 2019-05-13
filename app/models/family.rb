class Family < ApplicationRecord
  include Sluggable

  belongs_to :home_registration
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
