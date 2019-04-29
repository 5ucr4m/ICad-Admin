class GenericModel < ApplicationRecord
  include Sluggable

  belongs_to :generic_model, optional: true

  ransack_alias :search, :id_to_s
end
