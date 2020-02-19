class Medicine < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :therapeutic_class, class_name: 'GenericModel'
  belongs_to :product_type, class_name: 'GenericModel'
  belongs_to :stripe, class_name: 'GenericModel'
  belongs_to :company, optional: true

  validates :name, :substance, :laboratory, :laboratory_registry, :registry, :presentation, :ggrem_code, presence: true

  ransack_alias :search, :id_to_s
end
