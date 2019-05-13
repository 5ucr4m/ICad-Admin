class Address < ApplicationRecord
  include Sluggable

  belongs_to :address_type, class_name: 'GenericModel'
  belongs_to :city
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
