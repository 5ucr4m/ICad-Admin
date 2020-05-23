# frozen_string_literal: true
class MedicineSerializer < ApplicationSerializer
  attributes :id, :name, :substance, :laboratory, :laboratory_registry,
             :ggrem_code, :registry, :ean_one, :ean_two, :ean_three, :presentation
  has_one :therapeutic_class
  has_one :product_type
  has_one :stripe
  has_one :company
end
