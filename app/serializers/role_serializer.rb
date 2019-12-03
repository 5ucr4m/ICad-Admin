# frozen_string_literal: true

class RoleSerializer < ApplicationSerializer
  attributes :id, :name, :description, :role_type, :admin
end
