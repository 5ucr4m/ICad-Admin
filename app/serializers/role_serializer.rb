class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon, :model_reference, :action_reference, :url_reference, :slug
  has_one :role
  has_one :app_module
end
