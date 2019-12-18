class HealthConditionHeart < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :health_condition, optional: true
  belongs_to :disease_type, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
