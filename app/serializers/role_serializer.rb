# frozen_string_literal: true

class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :role_type, :admin, :slug
end
