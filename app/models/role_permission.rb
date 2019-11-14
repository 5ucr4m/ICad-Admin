# frozen_string_literal: true

class RolePermission < ApplicationRecord
  include Sluggable

  belongs_to :role
  belongs_to :permission

  ransack_alias :search, :id_to_s
end
