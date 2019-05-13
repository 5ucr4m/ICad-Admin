class HomeRegistration < ApplicationRecord

  include Sluggable

  belongs_to :health_professional
  belongs_to :living_condition
  belongs_to :address
  belongs_to :home_type, class_name: 'GenericModel'
  belongs_to :permanence_institution, optional: true
  belongs_to :company, optional: true

  accepts_nested_attributes_for :living_condition, allow_destroy: false
  accepts_nested_attributes_for :permanence_institution, allow_destroy: false
  accepts_nested_attributes_for :address, allow_destroy: false

  ransack_alias :search, :id_to_s
end
