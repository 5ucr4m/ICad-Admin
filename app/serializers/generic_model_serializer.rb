class GenericModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :reference, :generic_field, :generic_class, :slug
  has_one :generic_model
end
