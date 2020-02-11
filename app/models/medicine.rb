class Medicine < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :therapeutic_class, class_name: 'GenericModel'
  belongs_to :product_type, class_name: 'GenericModel'
  belongs_to :stripe, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
