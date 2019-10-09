class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon, :reference, :url, :slug
  has_one :role
  has_one :app_module
end
