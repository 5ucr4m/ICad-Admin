class VaccineSerializer < ActiveModel::Serializer
  attributes :id, :description, :lot_number, :manufacturer, :slug
  has_one :immunobiological
  has_one :vaccination_strategy
  has_one :dose
  has_one :company
end
