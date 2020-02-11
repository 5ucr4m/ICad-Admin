class MedicineSerializer < ApplicationSerializer
  attributes :id, :substance, :laboratory, :laboratory_registry, :ggrem_code, :registry, :ean_one, :ean_two, :ean_three, :active_principle, :slug, :discarded_at, :ip
  has_one :therapeutic_class
  has_one :product_type
  has_one :stripe
  has_one :company
end
